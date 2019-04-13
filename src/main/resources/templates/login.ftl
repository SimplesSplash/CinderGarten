<#import "parts/template.ftl" as t>

<@t.page>
<div class="ta-wc">
    <div class="app-title">
        <h1>Вход в Личный Кабинет</h1>
    </div>
    <form action="/login" method="post">
        <div class="control-group">
            <div class="col-sm-6">
                <input id="login-form" type="text" name="username" placeholder="User name">            
            </div>   
        </div>
        <div class="control-group">
            <div class="col-sm-6">
                <input id="pass-form" type="text" 
                       name="password" placeholder="Пароль">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div>
            <button type="submit" class="btn btn-primary mr-2"  />Войти</button>

        </div>
        <div class="pers_data">
            Входя в систему, вы даете согласие на обработку персональных данных
        </div>
    </form>   
</div>
</@t.page>
