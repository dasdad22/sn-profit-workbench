# SN Profit Workbench

手机优先的数码单品 SN、成本、卖出状态、签收倒计时和利润记录网页。

## 当前部署

- GitHub Pages: https://dasdad22.github.io/sn-profit-workbench/
- 没有配置云端数据库时，数据存储在使用者当前浏览器本地。
- 配置 Supabase 后，支持邮箱密码登录，并将记录保存到云端数据库。

## 开启云端同步

1. 创建 Supabase 项目。
2. 在 Supabase SQL Editor 执行 `supabase-schema.sql`。
3. 在 `index.html` 里填写：

```js
const CLOUD_CONFIG = {
  supabaseUrl: "https://你的项目.supabase.co",
  supabaseAnonKey: "你的 anon public key"
};
```

4. 提交并推送到 `main` 分支，GitHub Pages 会自动更新。

默认策略是每个登录账号只能看到自己的记录。
