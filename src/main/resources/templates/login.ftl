<#import "parts/template.ftl" as t>

<@t.page>
<div class="ta-wc text-center ">
    <div class="app-title">
        <h1>Вход в Личный Кабинет</h1>
    </div>

    <form action="/login"  class="d-inline-block mw-75" method="post">
        <div class="form-group">
            <input id="login-form" class="form-control " type="text" name="username" placeholder="User name">            
        </div>
        
        <div class="form-group "> 
            <input id="pass-form" class="form-control" type="password" name="password" placeholder="Пароль">
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
