const debug = require('debug')('OnlineEditorsExampleNodeJS')
const config = require('config')
const app = require('../app')

app.set('port', process.env.PORT || config.get('server.port') || 3000)

const server = app.listen(app.get('port'),"0.0.0.0", function () {
  console.log('服务已启动，监听端口：', app.get('port'))
})
