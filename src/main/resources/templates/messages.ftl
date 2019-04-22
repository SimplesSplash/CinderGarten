<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Личный кабинет</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="css/style1.css"  crossorigin="anonymous">
        
    </head>
    <body>
        <#include "parts/navbar.ftl">
        <div class="container mt-5">
            <div>
                <button class="btn btn-primary my-2" type="button" data-toggle="collapse" data-target="#sendMessage" aria-expanded="false" aria-controls="collapseExample">
                Написать сообщение
            </button>
            <div class="collapse" id="sendMessage">
            <form action="/messages" method="POST">
               
                    <label for="recipient">Получатель</label>
                <div class="form-group">
                    <input id="recipient"  class="form-control bs-autocomplete"
                           data-hidden_field_id="recipientId" 
                           data-item_id="id" data-item_label="fullName" 
                           autocomplete="off" 
                           name="recipientName" 
                           type="text"
                           placeholder="Выберите получателя">
                </div>
                <div class="form-group">     
                    <input class="form-control" id="recipientId" name="recipient" value="" type="hidden" >
                </div>
                <div class="form-group">
                    <label for="message">Сообщение</label>
                    <textarea  class="form-control" name="messageText" placeholder="Введите сообщение" ></textarea>

                </div>
                <input type="hidden"  name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Отправить сообщение</button>
            </form>
            </div>
            </div>
            
            <div>
                 <button class="btn btn-primary my-2" type="button" data-toggle="collapse" data-target="#messageFrom" aria-expanded="false" aria-controls="collapseExample">
                Отправленные сообщения
            </button>
                <div class="collapse" id="messageFrom">
                    <div class="accordion" id="accordionExample">
                        
                        <#list messagesFrom>
                        <#items as message>
                        <div class="card">
                          <div class="card-header" id="heading${message.id}">
                            <h2 class="mb-0">
                              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${message.id}" aria-expanded="true" aria-controls="collapse${message.id}">
                                <#if message.recipient.isTeacher()>
                                    ${message.recipient.getTeacher().getFullName()}
                                <#else>
                                ${message.recipient.getChild().getFullName()}
                                </#if>
                              </button>
                            </h2>
                          </div>

                          <div id="collapse${message.id}" class="collapse show" aria-labelledby="heading${message.id}" data-parent="#accordionExample">
                            <div class="card-body">
                                ${message.text}
                            </div>
                          </div>
                        </div>
                        </#items>
                       
                        <#else>
                        <div class="card" >
                            <div class="card-body">
                              <h5 class="card-title">Сообщений нет</h5>
                            </div>
                        </div>
                         </#list>
                    </div>
                </div>
            </div>
            
            <div>
                 <button class="btn btn-primary my-2" type="button" data-toggle="collapse" data-target="#messageTo" aria-expanded="false" aria-controls="collapseExample">
                Полученные сообщения
            </button>
                <div class="collapse" id="messageTo">
                    <div class="accordion" id="accordionExample1">
                        
                        <#list messagesTo>
                        <#items as message>
                        <div class="card">
                          <div class="card-header" id="heading${message.id}">
                            <h2 class="mb-0">
                              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${message.id}" aria-expanded="true" aria-controls="collapse${message.id}">
                                <#if message.sender.isTeacher()>
                                    ${message.sender.getTeacher().getFullName()}
                                <#else>
                                ${message.sender.getChild().getFullName()}
                                </#if>
                              </button>
                            </h2>
                          </div>

                          <div id="collapse${message.id}" class="collapse show" aria-labelledby="heading${message.id}" data-parent="#accordionExample1">
                            <div class="card-body">
                                ${message.text}
                            </div>
                          </div>
                        </div>
                        </#items>
                       
                        <#else>
                        <div class="card" >
                            <div class="card-body">
                              <h5 class="card-title">Сообщений нет</h5>
                            </div>
                        </div>
                         </#list>
                    </div>
                </div>
            </div>
        </div>
       
       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script id="rendered-js">
            $.widget("ui.autocomplete", $.ui.autocomplete, {

                _renderMenu: function (ul, items) {
                    var that = this;
                    ul.attr("class", "nav nav-pills nav-stacked  bs-autocomplete-menu");
                    $.each(items, function (index, item) {
                        that._renderItemData(ul, item);
                    });
                },

                _resizeMenu: function () {
                    var ul = this.menu.element;
                    ul.outerWidth(Math.min(
                            ul.width("").outerWidth() + 1,
                            this.element.outerWidth()
                            ));
                }

            });

            (function () {
            "use strict";
                    var recipients = [
                           <#list aviableRecipients as recipient>
                           {
                            "id": ${recipient.id},
                           "fullName": "${recipient.fullName}"
                }<#sep>, 
                </#list>
                    ];
                    
                    $('.bs-autocomplete').each(function () {
                                    var _this = $(this),
                                    _data = _this.data(),
                                    _hidden_field = $('#' + _data.hidden_field_id);
                                    _this.after('<div class="bs-autocomplete-feedback form-control-feedback"><div class="loader">Loading...</div></div>')
                                    .parent('.form-group').addClass('has-feedback');
                                    var feedback_icon = _this.next('.bs-autocomplete-feedback');
                                    feedback_icon.hide();
                                    _this.autocomplete({
                                    minLength: 1,
                                            autoFocus: false,
                                            source: function (request, response) {
                                            var _regexp = new RegExp(request.term, 'i');
                                                    var data = recipients.filter(function (item) {
                                                    return item.fullName.match(_regexp);
          });
          response(data);
        },
      
      search: function () {
                                                            feedback_icon.show();
                                                            _hidden_field.val('');
        },
        
        response: function () {
                                                            feedback_icon.hide();
        },
        
        focus: function (event, ui) {
                                                            _this.val(ui.item[_data.item_label]);
                                                            event.preventDefault();
        },
        
        select: function (event, ui) {
                                                            _this.val(ui.item[_data.item_label]);
                                                            _hidden_field.val(ui.item[_data.item_id]);
                                                            event.preventDefault();
        }
        })
        .data('ui-autocomplete')._renderItem = function (ul, item) {
                                                            return $('<li></li>')
                                                            .data("item.autocomplete", item)
                                                            .append('<a>' + item[_data.item_label] + '</a>')
                                                            .appendTo(ul);
        };
        
        });
        })();
        </script>



    </body>   
</html>

