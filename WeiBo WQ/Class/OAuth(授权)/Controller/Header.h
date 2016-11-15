参数
App Key：1312908092
App Secret：743140ed95833d49f31b5cead80f883c：
授权回调页：http://www.baidu.com


必选	类型及范围	说明
client_id	true	string	申请应用时分配的AppKey。
redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。

accossToken

URL https://api.weibo.com/oauth2/access_token


请求参数
必选	类型及范围	说明
client_id	true	string	申请应用时分配的AppKey。
client_secret	true	string	申请应用时分配的AppSecret。
grant_type	true	string	请求的类型，填写authorization_code
code	true	string	调用authorize获得的code值。
redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。

"access_token" = "2.00NYKMxCy3pq7B253171955eKk8aVD";
"expires_in" = 157679999;
"remind_in" = 157679999;
uid = 2706969985;
