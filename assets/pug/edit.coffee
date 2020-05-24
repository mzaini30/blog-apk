tinggi = ->
  $("textarea").css "height", $(window).height() - 200
tinggi()
$(window).resize ->
  tinggi()
app = new Vue
  el: ".vue"
  data:
    judul: ""
    isi: ""
  mounted: ->
    x = @
    blog.data.where
      id: Number localStorage.id
    .toArray().then (data) ->
      x.judul = data[0].judul
      x.isi = data[0].isi
  methods:
    ubah: ->
      x = @
      blog.data.where
        id: Number localStorage.id
      .modify
        judul: x.judul
        isi: x.isi
      .then ->
        location.href = "baca.html"