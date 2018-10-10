<div class="modal fade" id="confirmOrderModal" tabindex="-1" role="dialog" aria-labelledby="confirmOrderModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block">
                <div class="h2 modal-title text-center" id="confirmOrderModalTitle">Заказ сформирован</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <div class="modal-body">
                <div class="post">
                    <p>Ваш заказ <?= $order->id ?> от <?= $order->date ?> успешно создан. В ближайшее время мы свяжемся с вами по указаному при оформлении заказа телефону.</p>
                    <p>Вы можете следить за выполнением своего заказа в <a href="/account.html" class="border-bottom border-dark text-info" title="Личном кабинете">Личном кабинете</a></p>
                </div>
            </div>
        </div>
    </div>
</div><!-- #confirmOrderModal -->