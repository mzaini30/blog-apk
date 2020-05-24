app = new Vue
  el: ".vue"
  data:
    judul: ""
    tanggal: ""
    isi: ""
  mounted: ->
    x = @
    blog.data.where
      id: Number localStorage.id 
    .toArray().then (data) ->
      x.judul = data[0].judul
      x.tanggal = data[0].tanggal
      x.isi = marked data[0].isi
  methods:
    hapus: ->
      Swal.fire
        text: "Hapus kah?"
      .then (x) ->
        if x.value
          blog.data.where
            id: Number localStorage.id 
          .delete().then ->
            location.href = "index.html"