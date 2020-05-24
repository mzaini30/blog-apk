app = new Vue
  el: ".vue"
  data:
    postingan: []
    cari: ""
  mounted: ->
    x = @
    blog.data.orderBy("id").reverse().toArray().then (data) ->
      x.postingan = data
  filters:
    snippet: (x) ->
      "#{x[..250]}..."
  methods:
    buka: (x) ->
      localStorage.setItem "id", x
      location.href = "baca.html"
    acak: ->
      x = @
      blog.data.toArray().then (data) ->
        shuffle data
        x.postingan = data
    mulai_cari: ->
      x = @
      blog.data.orderBy("id").reverse().toArray().then (data) ->
        data = data.map (y) ->
          JSON.stringify y
        data = data.filter (y) ->
          y.match new RegExp x.cari, "i"
        data = data.map (y) ->
          JSON.parse y
        x.postingan = data
$(".navbar-brand").click (x) ->
  x.preventDefault()
  $("html, body").animate
    scrollTop: 0 
  , 800