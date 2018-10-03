<?php
namespace frontend\controllers;

use common\models\Banner;
use common\models\Brand;
use common\models\Category;
use common\models\Product;
use common\models\Profile;
use common\models\Settings;
use common\models\StaticPages;
use common\services\ProductsService;
use frontend\models\ChangePasswordForm;
use Yii;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * Site controller
 */
class SiteController extends \frontend\components\Controller
{
    public $layout = 'main';
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup', 'change-password'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout', 'change-password'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            /*'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],*/
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        $products = Product::find()->orderBy(['created_at' => SORT_DESC])->limit(6)->all();
        $productsHot = (new ProductsService())->getHot();
        $productsPromote = (new ProductsService())->getPromote();
        $productsNew = (new ProductsService())->getNew();
        $banners = Banner::find()->orderBy(['created_at' => SORT_DESC])->all();
        $allCategory = Category::find()->limit(8)->all();
        $brands = Brand::find()->all();
        $settings = Settings::find()->one();
        return $this->render('index', [
            'products' => $products,
            'productsHot' => $productsHot,
            'productsPromote' => $productsPromote,
            'productsNew' => $productsNew,
            'allCategory' => $allCategory,
            'banners' => $banners,
            'brands' => $brands,
            'settings' => $settings
        ]);
    }

    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        if (Yii::$app->request->get('returnUrl')) {
            Yii::$app->user->setReturnUrl(Yii::$app->request->get('returnUrl'));
        }

        $modelSignUp = new SignupForm();
        if ($modelSignUp->load(Yii::$app->request->post())) {
            if ($user = $modelSignUp->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        $modelLogin = new LoginForm();
        if ($modelLogin->load(Yii::$app->request->post()) && $modelLogin->login()) {
            return $this->goBack();
        }

        return $this->render('login', [
            'modelLogin' => $modelLogin,
            'modelSignUp' => $modelSignUp,
        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionContact()
    {
        $setting = Settings::find()->one();
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending email.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
                'setting' => $setting,
            ]);
        }
    }

    public function actionAbout()
    {
        $model = StaticPages::find()->where(['alias' => 'about'])->one();

        return $this->render('about', ['model' => $model]);
    }

    public function actionBlog()
    {
        return $this->render('blog/blog');
    }

    public function actionPaymentDelivery()
    {
        $model = StaticPages::find()->where(['alias' => 'payment-delivery'])->one();

        return $this->render('payment-delivery', ['model' => $model]);
    }

    public function actionWarranty()
    {
        $model = StaticPages::find()->where(['alias' => 'warranty'])->one();

        return $this->render('warranty', ['model' => $model]);
    }

    public function actionService()
    {
        $model = StaticPages::find()->where(['alias' => 'service'])->one();

        return $this->render('service', ['model' => $model]);
    }

    public function actionOurClients()
    {
        $model = StaticPages::find()->where(['alias' => 'our-clients'])->one();

        return $this->render('our-clients', ['model' => $model]);
    }

    public function actionOurPartners()
    {
        $model = StaticPages::find()->where(['alias' => 'our-partners'])->one();

        return $this->render('our-partners', ['model' => $model]);
    }

    public function actionOurProjects()
    {
        $model = StaticPages::find()->where(['alias' => 'our-projects'])->one();

        return $this->render('our-projects', ['model' => $model]);
    }

    public function actionMenuMobile()
    {
        $this->layout = 'clear';
        return $this->render('block/menu_mobile');
    }

    public function actionMenuDesktop()
    {
        $this->layout = 'clear';
        return $this->render('block/menu_desktop');
    }

    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Check your email for further instructions.'));

                //return $this->goHome();
            } else {
                Yii::$app->getSession()->setFlash('error', Yii::t('app', 'Sorry, we are unable to reset password for email provided.'));
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New password was saved.'));

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    public function actionChangePassword()
    {
        try {
            $model = new ChangePasswordForm();
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->changePassword()) {
            Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New password was saved.'));

            return $this->goHome();
        }

        return $this->render('changePassword', [
            'model' => $model,
        ]);
    }

    public function actionProfile()
    {
        $model = Profile::findOne(['user_id' => Yii::$app->user->id]);
        if (!$model) {
            $model = new Profile();
            $model->user_id = Yii::$app->user->id;
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->getSession()->setFlash('success', Yii::t('app', 'New password was saved.'));

            return $this->goHome();
        }

        return $this->render('profile', [
            'model' => $model,
        ]);
    }

    public function actionLoginInfo()
    {
        if (Yii::$app->user->isGuest) {
            return json_encode(['login' => 0]);
        } else {
            return json_encode([
                "login" => 1,
                'name' => Yii::$app->user->identity->username,
            ]);
        }
    }
}
