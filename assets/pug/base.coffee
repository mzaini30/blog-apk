blog = new Dexie "database blog"
blog.version(1).stores
  data: "++id, judul, isi, tanggal"
$(".nav-link").click ->
  $(".navbar-toggler").click()
sekarang = ->
  tanggal = new Date 
  bulan = [
    "Januari"
    "Februari"
    "Maret"
    "April"
    "Mei"
    "Juni"
    "Juli"
    "Agustus"
    "September"
    "Oktober"
    "November"
    "Desember"
  ]
  hari = [
    "Ahad"
    "Senin"
    "Selasa"
    "Rabu"
    "Kamis"
    "Jumat"
    "Sabtu"
  ]
  "#{hari[tanggal.getDay()]}, #{tanggal.getDate()} #{bulan[tanggal.getMonth()]} #{tanggal.getFullYear()}"
marked.setOptions
  breaks: true
shuffle = (array) ->
  currentIndex = array.length
  while currentIndex isnt 0
    randomIndex = Math.floor Math.random() * currentIndex
    currentIndex -= 1 
    temporaryValue = array[currentIndex]
    array[currentIndex] = array[randomIndex]
    array[randomIndex] = temporaryValue
  array 