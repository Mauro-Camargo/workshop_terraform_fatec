variable "environment" {
  default = "LAB"
}

############ Variáveis dos files ################

variable "path_files" {
  type    = string
  default = "C:/Users/moeg/sites/agencia/"
}

variable "site_files" {
  type    = list(string)
  default = ["index.html", "services.html", "contact.html", "work.html"]
}

variable "content_type_site_files" {
  type    = string
  default = "text/html"
}

############ Variavies das imagens ###############

variable "path_images" {
  type    = string
  default = "C:/Users/moeg/sites/agencia/images/"
}

variable "content_type_jpeg" {
  type    = string
  default = "image/jpeg"
}

variable "content_type_png" {
  type    = string
  default = "image/png"
}

variable "site_images_jpeg" {
  type = list(string)
  default = [
    "home-img.jpg",
    "img1.jpg",
    "portfolio-item1.jpg",
    "portfolio-item2.jpg",
    "portfolio-item3.jpg",
    "portfolio-item4.jpg",
    "portfolio-item5.jpg",
    "portfolio-item6.jpg",
    "portfolio-item7.jpg",
    "portfolio-item8.jpg",
    "portfolio-item9.jpg",
    "portfolio-item10.jpg",
    "portfolio-item11.jpg",
    "portfolio-item12.jpg",
    "portfolio-item13.jpg",
    "portfolio-item14.jpg",
    "portfolio-item15.jpg",
    "portfolio-item16.jpg",
  ]
}

variable "site_images_png" {
  type = list(string)
  default = [
    "screenshot.png",
    "twitter.png",
    "001.png",
    "002.png",
    "003.png",
    "004.png",
    "005.png",
    "006.png",
    "address.png",
    "call.png",
    "close.png",
    "email.png",
    "email2.png",
    "facebook.png",
    "instagram.png",
    "menu.png"
  ]
}

############## CSS Files ####################

variable "site_css" {
  type    = list(string)
  default = ["estilo.css"]
}

variable "path_css" {
  type    = string
  default = "C:/Users/moeg/sites/agencia/css/"
}

variable "content_type_site_css" {
  type    = string
  default = "text/css"
}

################ JS Files ##################

variable "site_js" {
  type    = list(string)
  default = ["script.js"]
}

variable "path_js" {
  type    = string
  default = "C:/Users/moeg/sites/agencia/js/"
}

variable "content_type_site_js" {
  type    = string
  default = "text/javascript"
}