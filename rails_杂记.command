https://ruby-china.github.io/rails-guides/getting_started.html

#	创建项目
rails new ProjectName

#	项目文件结构：

app/
	包含应用的控制器、模型、视图、辅助方法、邮件程序、频道、作业和静态资源文件。这个文件夹是本文剩余内容关注的重点。

bin/
	包含用于启动应用的 rails 脚本，以及用于安装、更新、部署或运行应用的其他脚本。

config/
	配置应用的路由、数据库等。详情请参阅配置 Rails 应用。

config.ru
	基于 Rack 的服务器所需的 Rack 配置，用于启动应用。

db/
	包含当前数据库的模式，以及数据库迁移文件。

Gemfile, Gemfile.lock
	这两个文件用于指定 Rails 应用所需的 gem 依赖。Bundler gem 需要用到这两个文件。关于 Bundler 的更多介绍，请访问 Bundler 官网。

lib/
	应用的扩展模块。

log/
	应用日志文件。

public/
	仅有的可以直接从外部访问的文件夹，包含静态文件和编译后的静态资源文件。

Rakefile
	定位并加载可在命令行中执行的任务。这些任务在 Rails 的各个组件中定义。如果要添加自定义任务，请不要修改 Rakefile，直接把自定义任务保存在 lib/tasks 文件夹中即可。

README.md
	应用的自述文件，说明应用的用途、安装方法等。

test/
	单元测试、固件和其他测试装置。详情请参阅Rails 应用测试指南。

tmp/
	临时文件（如缓存和 PID 文件）。

vendor/
	包含第三方代码，如第三方 gem。

.gitignore
	告诉 Git 要忽略的文件（或模式）。详情参见 GitHub 帮助文档。

#	启动
rails server
rails s

#	停止
Ctrl + C


