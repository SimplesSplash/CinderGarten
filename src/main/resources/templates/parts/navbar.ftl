
<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Личный кабинет</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Главная<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/messages">Сообщения</a>
            </li>   
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Список пользователей</a>
            </li>
            </#if>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/user/profile">Профиль</a>
            </li>
            </#if>
        </ul>
        <div class=" navbar-text mr-2">${name}</div>
        <#if known>
        <form action="/logout" method="post">
            <button type="submit" class="btn btn-primary mr-2">Выйти</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />

        </form>
        </#if>
    </div>
</nav>

