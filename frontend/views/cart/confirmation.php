<!-- main -->
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'completed',
                'stepTree' => 'completed',
                'stepFour' => 'active',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <div class="h2">Проверьте внесенные данные:</div>
                    <div class="checkout__confirm">
                        <ul class="checkout__confirm--data">
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>Имя Фамилия Отчество</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Имя" aria-label="Имя"
                                               aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>adresadresadresadres@mail.ru</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="email" class="form-control" placeholder="email" aria-label="email">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>+7 (495) 600-88-99</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="tel" class="form-control" placeholder="Phone" aria-label="Phone">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>Регион</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Регион"
                                               aria-label="Регион">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>Населенный пункт</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Населенный пункт"
                                               aria-label="Населенный пункт">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>ул. Адрес, дом 135, кв. 46</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Адресс"
                                               aria-label="Адресс">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value">
                                    <span>Способ доставки</span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <form action="" class="collapse">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Способ доставки"
                                               aria-label="Способ доставки">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i
                                                    class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div><!-- .checkout__confirm -->
                    <div class="cart-buttons row justify-content-md-end order-md-2">
                        <div class="col-md-6 order-md-0 text-xl-right">
                            <button class="btn btn-info btn-icon" data-toggle="modal" data-target="#testModal">
                                <span>Заказ подтверждаю</span>
                            </button>
                        </div>
                    </div><!-- .cart-buttons -->
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <?= $this->render('part/your-order', ['products' => $products]) ?>
                </div><!-- .checkout__body -->
            </div>
    </section><!-- .cart -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-checkout');
</script>