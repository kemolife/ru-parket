<p>Ваш заказ <?= $order->id ?> от <?= date('d.m.Y' , $order->created_at) ?> успешно создан. В ближайшее время мы свяжемся с вами по указаному при оформлении заказа телефону.</p>
<p>Вы можете следить за выполнением своего заказа в <a href="<?= Yii::$app->urlManager->createUrl(['order']); ?>" class="border-bottom border-dark text-info" title="Личном кабинете">Личном кабинете</a></p>