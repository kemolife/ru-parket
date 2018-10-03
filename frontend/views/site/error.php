<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

$this->title = $name;
?>
<main class="main" role="main">

    <section class="section error">
        <div class="container">
            <div class="error__container">
                <figure class="position-absolute">
                    <img src="/img/404.jpg" alt="error picture">
                </figure>
                <div class="error__content d-flex align-items-center text-info">
                    <strong class="error__content--small">Ошибка</strong>
                    <strong class="error__content--big">404</strong>
                </div>
            </div><!-- .error__container -->
            <div class="buttons text-center">
                <a href="<?= Yii::$app->homeUrl ?>" class="btn btn-primary btn-icon" role="button" title="На главную">
                    <span>На главную</span>
                    <i class="material-icons">arrow_forward</i>
                </a>
            </div>
        </div>
    </section><!-- .error -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-404');
