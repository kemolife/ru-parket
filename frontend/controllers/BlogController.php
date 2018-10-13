<?php
/**
 * Created by PhpStorm.
 * User: home
 * Date: 09.09.18
 * Time: 22:10
 */

namespace frontend\controllers;


use common\models\BlogComment;
use common\models\BlogPost;
use common\models\Product;
use common\models\StatusBlog;
use frontend\components\Controller;
use Yii;
use yii\data\Pagination;
use yii\widgets\ActiveForm;

class BlogController extends \frontend\components\Controller
{
    public function actionIndex()
    {
        $popularsPosts = BlogPost::find()->where(['brief' => 'popular'])->limit(4)->all();
        $bigPosts = BlogPost::find()->orderBy('created_at desc')->limit(2)->all();

        $query = BlogPost::find();
        $query->where([
            'status' => StatusBlog::STATUS_ACTIVE,
        ]);

        $pagination = new Pagination([
            'defaultPageSize' => Yii::$app->params['blogPostPageCount'],
            'totalCount' => $query->count(),
        ]);

        $posts = $query->orderBy('created_at desc')
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('index', [
            'posts' => $posts,
            'pagination' => $pagination,
            'popularsPosts' => $popularsPosts,
            'bigPosts' => $bigPosts
        ]);
    }

    public function actionPost($id)
    {

        if ($id) {
            $recommendedItems = Product::find()->where(['status' => Product::STATUS_ACTIVE])->orderBy(['created_at' => SORT_DESC])->limit(10)->all();
            $posts = BlogPost::find()->orderBy('created_at desc')->limit(2)->all();
            $post = BlogPost::findOne(Yii::$app->request->get('id'));
            $post->updateCounters(['click' => 1]);
            $comments = BlogComment::find()->where(['post_id' => $post->id, 'status' => StatusBlog::STATUS_ACTIVE])->orderBy(['created_at' => SORT_ASC])->all();
            $commenMtodel = $this->newComment($post);
        } else {
            $this->redirect(['/blog']);
        }

        return $this->render('post', [
            'post' => $post,
            'comments' => $comments,
            'commentModel' => $commenMtodel,
            'recommendedItems' => $recommendedItems,
            'posts' => $posts,
        ]);
    }

    public function actionSearch()
    {
        $popularsPosts = BlogPost::find()->where(['brief' => 'popular'])->limit(4)->all();
        $query = BlogPost::find();
        $query->where([
            'status' => StatusBlog::STATUS_ACTIVE,
        ]);
        if (Yii::$app->request->get('keyword')) {

            $keyword = strtr(Yii::$app->request->get('keyword'), array('%' => '\%', '_' => '\_', '\\' => '\\\\'));
            $keyword = Yii::$app->formatter->asText($keyword);

            $query->andFilterWhere([
                'or', ['like', 'title', $keyword], ['like', 'content', $keyword]
            ]);
        }

        if (Yii::$app->request->get('tag')) {
            $query->andFilterWhere([
                'like', 'tags', Yii::$app->request->get('tag'),
            ]);
        }

        $pagination = new Pagination([
            'defaultPageSize' => Yii::$app->params['blogPostPageCount'],
            'totalCount' => $query->count(),
        ]);

        $posts = $query->orderBy('created_at desc')
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('search', [
            'posts' => $posts,
            'pagination' => $pagination,
            'popularsPosts' => $popularsPosts,
            ]);
    }

    protected function newComment($post)
    {
        $comment = new BlogComment;
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'comment-form') {
            echo ActiveForm::validate($comment);
//            Yii::$app->end();
        }

        if (Yii::$app->request->post('BlogComment')) {
            $comment->load(Yii::$app->request->post());
            if ($post->addComment($comment)) {
                if ($comment->status == StatusBlog::STATUS_INACTIVE)
                    echo Yii::$app->formatter->asText('success');
            } else {
                echo 'failed';
            }
            die();
        }
        return $comment;
    }
}