<?php

namespace backend\controllers;

use backend\widgets\image\RemoveAction;
use backend\widgets\image\UploadAction;
use common\models\Brand;
use common\models\Category;
use common\models\ProductImage;
use common\models\ProductType;
use common\models\Status;
use common\models\UploadImage;
use Yii;
use common\models\Product;
use common\models\ProductSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends Controller
{
    public $enableCsrfValidation = false;

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ],
        ];
    }

    public function actions()
    {
        return [
            'upload' => [
                'class' => UploadAction::className(),
                'upload' => 'upload',
            ],
            'remove' => [
                'class' => RemoveAction::className(),
                'uploadDir' => '@frontend/web/',
            ],
        ];
    }


    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Product model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $last = Product::find()->orderBy(['id' => SORT_DESC])->one();

        $model = new Product();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post())) {
            $model->type = ProductType::arrayToInt($model->type);
            if ($model->save()) {
                return $this->redirect(['index', 'id' => $model->id]);
            }
       }

        return $this->render('create', [
            'model' => $model,
            'last' => $last
        ]);
    }

    /**
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //if(!Yii::$app->user->can('updateYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
            $model->type = ProductType::arrayToInt($model->type);
            if ($model->save()) {

                $productImage = ProductImage::find()->where(['product_id' => $id])->orderBy(['sort_order' => SORT_ASC])->one();
                if ($productImage) {
                    $model->image = $productImage->image;
                    $model->thumb = $productImage->thumb;
                    $model->save();
                }

                return $this->redirect(['index', 'id' => $model->id]);
            }
        }

        $model->type = ProductType::intToArray($model->type);
        return $this->render('update', [
            'model' => $model,
        ]);

    }

    public function actionImageUpload($product)
    {
        $model = new UploadImage();

        if (Yii::$app->request->isPost) {
            $model->imageFile = UploadedFile::getInstanceByName('file');
            if ($productName  = $model->upload()) {
                $productImage = new ProductImage();
                $productImage->product_id = $product;
                $productImage->filename = $productImage->image=  $productImage->thumb = $productName;
                $productImage->save(false);
                return 'ok';
            }
        }

        Yii::$app->response->setStatusCode(400);
        return 'error';
    }

    /**
     * Deletes an existing Product model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //if(!Yii::$app->user->can('deleteYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        /*$this->findModel($id)->delete();*/
        $model = $this->findModel($id);
        $model->status = Status::STATUS_DELETED;
        $model->save();

        return $this->redirect(['index']);
    }

    /**
     * Batch delete existing Product models.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBatchDelete()
    {
        //if(!Yii::$app->user->can('deleteYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $ids = Yii::$app->request->post('ids');
        if (is_array($ids)) {
            foreach ($ids as $id) {
                /*$this->findModel($id)->delete();*/
                $model = $this->findModel($id);
                $model->status = Status::STATUS_DELETED;
                $model->save();
            }
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * batch import product
     * @param integer $id
     * @return mixed
     */
    public function actionImport()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $format = Product::getImportExportFormat();

        if (Yii::$app->request->post()) {
            $countCreate = $countUpdate = 0;

            $file = UploadedFile::getInstanceByName('importFile');
            $handle = fopen($file->tempName, 'r');
            $result = $this->inputCsv($handle);

            $arrData = [];
            if (count($result) <= 1) {
                Yii::$app->getSession()->setFlash('danger', Yii::t('app', 'No Record, please check file.'));
            } else {
                for ($i = 1; $i < count($result); $i++) {
                    $j = 0;
                    foreach ($format as $item) {
                        $data[$item] = $result[$i][$j];
                        $j++;
                    }
                    $data['thumbs'] = $result[$i][$j];
                    $data['images'] = $result[$i][$j + 1];

                    array_push($arrData, $data);
                }

                $line = 2;
                $errorLines = [];
                foreach($arrData as $item) {
                    if ($item['id'] > 0) {
                        $model = Product::findOne($item['id']);
                        if ($model === null) {
                            array_push($errorLines, $line);
                            $line++;
                            continue;
                        }
                        foreach ($item as $k => $v) {
                            if ($k == 'id' || $k == 'thumbs' || $k == 'images')
                                continue;

                            $model[$k] = iconv('gb2312', 'utf-8', trim($v));
                        }

                        $result = $model->save();
                        if (!$result) {
                            array_push($errorLines, $line);
                            $line++;
                            continue;
                        }
                        $countUpdate++;

                        if ($item['thumbs'] && $item['images']) {
                            $arrThumb = explode('|', $item['thumbs']);
                            $arrImage = explode('|', $item['images']);
                            $i = 0;
                            $ids = [];
                            foreach ($arrThumb as $thumb) {
                                $thumb = trim($thumb);
                                $image = trim($arrImage[$i]);
                                $productImage = ProductImage::find()->where(['product_id' => $item['id'], 'thumb' => $thumb, 'image' => $image])->one();
                                if ($productImage) {
                                    array_push($ids, $productImage->id);
                                } else {
                                    $productImage = new ProductImage([
                                        'product_id' => $item['id'],
                                        'thumb' => $thumb,
                                        'image' => $image,
                                    ]);
                                    $productImage->save();

                                    array_push($ids, $productImage->id);
                                }

                                $i++;
                            }

                            ProductImage::deleteAll(['and', 'product_id=' . $item['id'], ['not in', 'id', $ids]]);
                        }
                    } else {
                        $model = new Product();
                        foreach ($item as $k => $v) {
                            if ($k == 'id' || $k == 'thumbs' || $k == 'images')
                                continue;

                            $model[$k] = iconv('gb2312', 'utf-8', trim($v));
                        }

                        $category = Category::find()->where(['name' => trim($model->category_id)])->one();
                        $model->category_id = $category ? $category->id : 1;
                        $brand = Brand::find()->where(['name' => trim($model->brand_id)])->one();
                        $model->brand_id = $brand ? $brand->id : 0;

                        $result = $model->save();
                        if (!$result) {
                            array_push($errorLines, $line);
                            $line++;
                            continue;
                        }
                        $countCreate++;

                        if ($item['thumbs'] && $item['images']) {
                            $arrThumb = explode('|', $item['thumbs']);
                            $arrImage = explode('|', $item['images']);
                            $i = 0;
                            foreach ($arrThumb as $thumb) {
                                $thumb = trim($thumb);
                                $image = trim($arrImage[$i]);
                                if ($thumb && $image) {
                                    $productImage = new ProductImage([
                                        'product_id' => $model->id,
                                        'thumb' => $thumb,
                                        'image' => $image,
                                    ]);
                                    $productImage->save();
                                }

                                $i++;
                            }
                        }
                    }
                    $line++;
                }
                if (count($errorLines)) {
                    $strLine = implode(', ', $errorLines);
                    Yii::$app->getSession()->setFlash('danger', Yii::t('app', "Line {strLine} error.", ['strLine' => $strLine] ));
                }
                Yii::$app->getSession()->setFlash('success', Yii::t('app', "Import Data Success. Create: {countCreate}  Update: {countUpdate}", ['countCreate' => $countCreate, 'countUpdate' => $countUpdate] ));
            }
        }

        return $this->render('import', [
        ]);
    }

    public function inputCsv($handle)
    {
        $out = array ();
        $n = 0;
        while ($data = fgetcsv($handle, 10000))
        {
            $num = count($data);
            for ($i = 0; $i < $num; $i++)
            {
                $out[$n][$i] = $data[$i];
            }
            $n++;
        }
        return $out;
    }
    /**
     * batch export product
     * @param integer $id
     * @return mixed
     */
    public function actionExport()
    {
        //if(!Yii::$app->user->can('viewYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));
        $format = Product::getImportExportFormat();

        $products = Product::find()->orderBy(['id' => SORT_ASC])->all();

        $str = '';

        $product = new Product();
        $start = true;
        foreach ($format as $column) {
            if ($start) {
                $str .= '"' . iconv('utf-8', 'gb2312', $product->attributeLabels()[$column]) . '"';
                $start = false;
            } else {
                $str .= ',"' . iconv('utf-8', 'gb2312', $product->attributeLabels()[$column]) . '"';
            }
        }
        $str .= ',' . iconv('utf-8', 'gb2312', Yii::t('app', 'Thumbs')) . ',' . iconv('utf-8', 'gb2312', Yii::t('app', 'Images'));
        $str .= "\n";

        foreach ($products as $row) {
            $start = true;
            foreach ($format as $column) {
                $value = '';
                if ($column == 'category_id') {
                    if ($row[$column] > 0) {
                        $category = Category::findOne($row[$column]);
                        $value = iconv('utf-8', 'gb2312', $category->name);
                    }
                } elseif ($column == 'brand_id') {
                    if ($row[$column] > 0) {
                        $brand = Brand::findOne($row[$column]);
                        $value = iconv('utf-8', 'gb2312', $brand->name);
                    }
                } else {
                    $value = iconv('utf-8', 'gb2312', $row[$column]);
                }
                if ($start) {
                    $str .= '"' . $value . '"';
                    $start = false;
                } else {
                    $str .= ',"' . str_replace("\"", "\"\"", $value) . '"';
                }
            }
            $start = true;
            $strThumb = $strImage = '';
            $productImages = ProductImage::find()->where(['product_id' => $row->id])->all();
            foreach ($productImages as $item) {
                if ($start) {
                    $strThumb .= $item->thumb;
                    $strImage .= $item->image;
                    $start = false;
                } else {
                    $strThumb .= '|' . $item->thumb;
                    $strImage .= '|' . $item->image;
                }
            }
            $str .= ',"' . $strThumb . '","' . $strImage . '"';

            $str .= "\n";
        }

        $filename = date('Ymd').'.csv';

        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$filename);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        echo $str;
    }



}
