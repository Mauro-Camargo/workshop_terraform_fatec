resource "aws_s3_bucket" "webserver_fatec_bucket" {
  bucket = "meubucketparasitenafatec.com"
  //acl    = "public-read"
  //policy = file("policy.json")

  tags = {
    Env   = "Dev"
    Local = "Fatec SR"
  }
}

##### Configurando bucket como website

resource "aws_s3_bucket_website_configuration" "fatec_website" {
  bucket = aws_s3_bucket.webserver_fatec_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#### Configurando ACL como público e para leitura

resource "aws_s3_bucket_acl" "webserver_fatec_acl" {
  depends_on = [
    aws_s3_bucket_public_access_block.public_access_block_webserver_fatec,
    aws_s3_bucket_ownership_controls.ownership_controls_webserver_fatec,
  ]

  bucket = aws_s3_bucket.webserver_fatec_bucket.id
  acl    = "public-read"
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

###### Recursos que dão permissão de público para o bucket
# Documentação do issue - https://github.com/hashicorp/terraform-provider-aws/issues/28353
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
