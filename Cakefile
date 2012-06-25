giles = require '../giles/giles'
source = "calc.jade"

giles.get '/index.html', source, { title : "255 BITS Consulting Services" } 

task 'build', "Build the SEO portion of the app for deployment", ()->
  giles.build(__dirname, {
    #    output: "build"
  })

task 'server', 'Start a giles server', () ->
  giles.server(__dirname, {
    port : 2255
  })
