<!-- main -->
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'completed',
                'stepTree' => 'active',
                'stepFour' => '',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <div class="h2">Выберите способ оплаты:</div>
                    <fieldset>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod1" name="customRadio" class="checkbox" checked>
                            <label class="" for="checkPaymentMethod1"><span class="icon d-inline-block"><img src="/img/svg/opt/wallet.svg" class="img-fluid" alt=""></span><span>Наличные при получении товара</span></label>
                        </div>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod2" name="customRadio" class="checkbox">
                            <label class="" for="checkPaymentMethod2"><span class="icon d-inline-block"><img src="/img/svg/opt/document.svg" class="img-fluid" alt=""></span><span>Оплата по счету (счет отдельно выставляется менеджером)</span></label>
                        </div>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod3" name="customRadio" class="checkbox">
                            <label class="" for="checkPaymentMethod3"><span class="icon d-inline-block"><img src="/img/svg/opt/wallet1.svg" class="img-fluid" alt=""></span><span>Безналичный расчет</span></label>
                        </div>
                    </fieldset>
                    <div class="h2">Способ доставки</div>
                    <fieldset>
                        <div class="form-group">
                            <select class="custom-select" id="deliveryRegion" required>
                                <option selected>Ваш регион</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="custom-select" id="deliveryCity" required>
                                <option selected>Населенный пункт</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="checkoutDeliveryAddress">Адрес *</label>
                            <input type="text" class="form-control is-invalid" id="checkoutDeliveryAddress" required>
                            <small class="text-danger">Пример поля с ошибкой</small>
                        </div>
                        <div class="form-group">
                            <select class="custom-select" id="deliveryMethod" required>
                                <option selected>Способ доставки</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </fieldset>
                    <div class="cart-buttons row justify-content-md-end order-md-2">
                        <div class="col-md-6 order-md-0">
                            <a href="" class="btn btn-info btn-icon" role="button" title="Продолжить">
                                <span>Продолжить</span>
                                <i class="material-icons">arrow_forward</i>
                            </a>
                        </div>
                    </div><!-- .cart-buttons -->
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <?= $this->render('part/your-order', ['products' => $products]) ?>
                </div>
            </div><!-- .checkout__body -->
        </div>
    </section><!-- .cart -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-checkout');
</script>