<div class="modal fade" id="consultantModal" tabindex="-1" role="dialog" aria-labelledby="consultantModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="h1 modal-title" id="consultantModalTitle">Заказать консультацию технолога</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <div class="modal-body">
                <form action="" class="form">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="border border-primary p-3">
                                <div class="form-checkbox custom-control d-flex">
                                    <input type="radio" id="consultantMethod1" name="customRadio" class="checkbox" checked>
                                    <label class="" for="consultantMethod1"><span>Предварительная консультация без выезда на объект, <strong>БЕСПЛАТНО</strong></span></label>
                                </div>
                            </div>
                            <div class="border border-primary p-3 my-4">
                                <div class="form-checkbox custom-control d-flex">
                                    <input type="radio" id="consultantMethod2" name="customRadio" class="checkbox">
                                    <label class="" for="consultantMethod2"><span>Консультация с выездом на объект и проведением комплекса мероприятей, <strong>ПЛАТНО</strong></span></label>
                                </div>
                                <div class="pl-3 mt-4">
                                    <p>Стоимость выезда:<br>По Москве в предедах МКАД - 1500 руб.<br>За МКАД до 20 км - 2000 руб., свыше - 2000 руб. + 30 руб./км.<br>За МКАД свыше 100 км - по договоренности.</p>
                                    <p>При заключении договора на монтаж оплата выезда компенсируется за счет скидки на стоимость выезда технолога.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="border border-primary p-3">
                                <p>Все поля обязательны для заполнения!</p>
                                <div class="form-group">
                                    <label for="consultant-name" class="col-form-label">Ваше имя</label>
                                    <input type="text" class="form-control" id="consultant-name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="consultant-tel" class="col-form-label">Телефон</label>
                                    <input type="tel" class="form-control" id="consultant-tel" name="phone" required>
                                </div>
                                <div class="form-group">
                                    <label for="consultant-square" class="col-form-label">Площадь м2:</label>
                                    <input type="number" class="form-control" id="consultant-square" name="square" min="1">
                                </div>
                                <div class="form-group">
                                    <label for="consultant-address" class="col-form-label">Адрес</label>
                                    <input type="text" class="form-control" id="consultant-address" name="address">
                                </div>
                                <p>Также оформить вызов технолога на ваш объект вы можете связавшись с нами по телефону</p>
                                <p><strong>+7 (495) 662-98-97</strong> или отправив заявку на электронный адрес <strong>info@ru-parket.ru</strong></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-flex flex-column">
                <button class="btn btn-primary btn-icon" type="submit">
                    <span>Отправить заявку</span>
                    <i class="material-icons">send</i>
                </button>
            </div>
        </div>
    </div>
</div><!-- #consultantModal -->