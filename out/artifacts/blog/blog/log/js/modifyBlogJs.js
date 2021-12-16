function isTrue() {
    if (document.getElementById("isBadge").checked)
        document.getElementById("badgeDiv").style.visibility = "visible"
    else
        document.getElementById("badgeDiv").style.visibility = "hidden"
}

function submitData() {
    const submit = document.createElement("form");
    const id = document.createElement("input");
    const title = document.createElement("input");
    const author = document.createElement("input");
    const text = document.createElement("input");
    const isBadge=document.getElementById("isBadge");
    const badge = document.createElement("input");
    id.name="ID";
    id.value=document.getElementById("blogID").value;
    title.name = "title";
    title.value = document.getElementById("title").value;
    author.name = "author";
    author.value = document.getElementById("author").value;
    text.name = "blogText";
    text.value = document.getElementById("text").value;
    if(isBadge.checked) {
        badge.name = "badge";
        badge.value = document.getElementById("badge").value;
    }
    submit.action = "/saveBlogData"
    submit.method = "post";
    submit.appendChild(id);
    submit.appendChild(title);
    submit.appendChild(author);
    submit.appendChild(text);
    submit.appendChild(badge);
    document.body.appendChild(submit);
    submit.submit();
    alert("数据提交成功");
}