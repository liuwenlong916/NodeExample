const http = require('http')
const createHandler = require('github-webhook-handler')
const handler = createHandler({
  path: '/docker_deploy',
  secret: 'myHashSecret'
})
http
  .createServer((req, res) => {
    handler(req, res, err => {
      res.statusCode = 404
      console.log(err)
      res.end('no such location')
    })
  })
  .listen(7777, () => {
    console.log('Webhook listen at 7777')
  })
handler.on('error', err => {
  console.error('Error', err.message)
})
handler.on('push', event => {
  // console.log('Received * ', event.payload)
  if (event.payload.ref === 'refs/heads/master') {
    console.log('deploy master..')
    run_cmd('sh', ['./deploy-dev.sh'], function (text) {
      console.log(text)
    })
  }
})
function run_cmd(cmd, args, callback) {
  var spawn = require('child_process').spawn
  var child = spawn(cmd, args)
  var resp = ''
  child.stdout.on('data', function (buffer) {
    resp += buffer.toString()
  })
  child.stdout.on('end', function () {
    callback(resp)
  })
}
