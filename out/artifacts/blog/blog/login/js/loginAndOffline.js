function showLogin() {
    const bg = document.getElementById("loginBody");
    const login = document.getElementById("login");
    const close = document.getElementById("loginClose");
    login.style.left = (window.screen.width - 400) / 2 + "px";
    login.style.top = (window.screen.height - 700) / 2 + "px";
    login.style.display = "block";
    bg.style.display = "block";
    close.onclick = function () {
        bg.style.display = "none";
        login.style.display = "none";
    }
}

function login() {
    const sign = document.createElement("form");
    const name = document.createElement("input");
    const password = document.createElement("input");
    const rememberMe = document.createElement("input");
    const nameStr = document.getElementById("name").value;
    const passwordStr = document.getElementById("password").value;
    if (nameStr.length === 0 || nameStr.trim() === "") {
        alert("请输入昵称后在登录")
    } else if (passwordStr.length === 0 || passwordStr === "") {
        alert("密码还是要填一下吧");
    } else if (nameStr.trim() === "无名") {
        alert("请不要使用越权名称");
    } else {
        name.name = "username";
        name.value = nameStr;
        password.name = "password";
        password.value = passwordStr;
        rememberMe.name = "rememberMe";
        rememberMe.value = document.getElementById("remember-me").checked;
        sign.appendChild(name);
        sign.appendChild(password);
        sign.appendChild(rememberMe);
        document.body.appendChild(sign);
        sign.action = "/login";
        sign.method = "post"
        sign.submit();
    }
}

function offline(){
    const a = confirm("要下线嘛？");
    if(a===true)
    location.href="/offline"
    else
        location.href="/"
}