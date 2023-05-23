resource "aws_s3_bucket" "webserver_fatec_bucket" {
  bucket = "meubucketparasitenafatec.com"
  //acl    = "public-read"
  //policy = file("policy.json")

  tags = {
    Env   = "Dev"
    Local = "Fatec SR"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block_webserver_fatec" {
  bucket = aws_s3_bucket.webserver_fatec_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls_webserver_fatec" {
  bucket = aws_s3_bucket.webserver_fatec_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "webserver_fatec_acl" {
  depends_on = [
    aws_s3_bucket_public_access_block.public_access_block_webserver_fatec,
    aws_s3_bucket_ownership_controls.ownership_controls_webserver_fatec,
  ]

  bucket = aws_s3_bucket.webserver_fatec_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.webserver_fatec_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.webserver_fatec_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "fatec_website" {
  bucket = aws_s3_bucket.webserver_fatec_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

############ Uploading objects ###############

# HTML FILES
resource "aws_s3_object" "webserver_files_site_fatec" {
  count = length(var.site_files)

  bucket       = aws_s3_bucket.webserver_fatec_bucket.id
  key          = var.site_files[count.index]
  source       = "${var.path_files}${var.site_files[count.index]}"
  content_type = var.content_type_site_files
}

# Images Files
resource "aws_s3_object" "webserver_images_site_fatec_jpeg" {
  count = length(var.site_images_jpeg)

  bucket       = aws_s3_bucket.webserver_fatec_bucket.id
  key          = "images/${var.site_images_jpeg[count.index]}"
  source       = "${var.path_images}${var.site_images_jpeg[count.index]}"
  content_type = var.content_type_jpeg
}

resource "aws_s3_object" "webserver_images_site_fatec_png" {
  count = length(var.site_images_png)

  bucket       = aws_s3_bucket.webserver_fatec_bucket.id
  key          = "images/${var.site_images_png[count.index]}"
  source       = "${var.path_images}${var.site_images_png[count.index]}"
  content_type = var.content_type_png
}

# CSS File
resource "aws_s3_object" "css_site_fatec" {
  count        = length(var.site_css)
  bucket       = aws_s3_bucket.webserver_fatec_bucket.id
  key          = "css/${var.site_css[count.index]}"
  source       = "${var.path_css}${var.site_css[count.index]}"
  content_type = var.content_type_site_css
}

#JS File
resource "aws_s3_object" "js_site_fatec" {
  count        = length(var.site_js)
  bucket       = aws_s3_bucket.webserver_fatec_bucket.id
  key          = "js/${var.site_js[count.index]}"
  source       = "${var.path_js}${var.site_js[count.index]}"
  content_type = var.content_type_site_js
}

########### Manually Files ###########################

# resource "aws_s3_bucket_object" "webserver_fatec_css" {
#   bucket = aws_s3_bucket.webserver_fatec_bucket.id
#   key    = "css/"

#   # Usa o caminho da pasta local para enviar tudo que está dentro dela
#   content      = base64encode(join("", [for f in fileset("C:/Users/moeg/sites/burger/css", "**/*") : file("C:/Users/moeg/sites/burger/css/${f}")]))
#   content_type = "application/x-gzip"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_index" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "index.html"
#   source       = "C:/Users/moeg/sites/burger/index.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_ofertas" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "ofertas.html"
#   source       = "C:/Users/moeg/sites/burger/ofertas.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_bebidas" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "bebidas.html"
#   source       = "C:/Users/moeg/sites/burger/bebidas.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_cardapio" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "cardapio.html"
#   source       = "C:/Users/moeg/sites/burger/cardapio.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_sobre" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "sobre.html"
#   source       = "C:/Users/moeg/sites/burger/sobre.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_porcoes" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "porcoes.html"
#   source       = "C:/Users/moeg/sites/burger/porcoes.html"
#   content_type = "text/html"
# }

# resource "aws_s3_bucket_object" "webserver_fatec_contato" {
#   bucket       = aws_s3_bucket.webserver_fatec_bucket.id
#   key          = "contato.html"
#   source       = "C:/Users/moeg/sites/burger/contato.html"
#   content_type = "text/html"
# }

#########################################################

######### Folder #################

# resource "aws_s3_bucket_object" "webserver_fatec_images" {
#   for_each = fileset(local.image_folder, "**/*")

#   bucket = aws_s3_bucket.webserver_fatec_bucket.id
#   key    = "imagens/${each.value}"
#   content_type = lookup(var.content_types, extname(each.value), "application/octet-stream")

#   content {
#     base64 = true
#     # Usa a variável local para o caminho da pasta
#     source = file("${local.image_folder}/${each.value}")
#   }
# }

