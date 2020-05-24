tinggi = ->
  $("textarea").css "height", $(window).height() - 200
tinggi()
$(window).resize ->
  tinggi()
$("form").on "submit", (x) ->
  x.preventDefault()
  blog.data.add
    judul: $(".judul").val()
    isi: $(".isi").val()
    tanggal: sekarang()
  .then ->
    blog.data.orderBy("id").reverse().toArray().then (data) ->
      localStorage.setItem "id", data[0].id
      location.href = "baca.html"