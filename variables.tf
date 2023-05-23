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

############## CSS Files

variable "site_css" {
  type    = list(string)
  default = ["style.css"]
}

variable "path_css" {
  type    = string
  default = "C:/Users/moeg/sites/agencia/css/"
}

variable "content_type_site_css" {
  type    = string
  default = "text/css"
}

################ JS Files

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

# variable "site_files" {
#   type    = list(string)
#   default = ["cantinatialina.html", "home.html", "portuguesa.html", "vinicula_goes.html", "contato.html", "quemsomos.html", "italiana.html", "restaurantes.html", "donpatto.html", "olivardo.html", "termos.html"]
# }

# variable "site_images" {
#   type = list(string)
#   default = [
#     "Rectanglegr.png",
#     "Rectanglegrpurple.png",
#     "colher.png",
#     "facebook.png",
#     "food1.jpg",
#     "food2.jpg",
#     "food3.jpg",
#     "food4.jpg",
#     "food5.jpg",
#     "gp1.png",
#     "img title.png",
#     "instagram.png",
#     "logo.png",
#     "olivardo1.jpg",
#     "olivardo2.png",
#     "olivardo3.png",
#     "photothumb.db",
#     "picanha_img-removebg-preview.png",
#     "port1.jpg",
#     "port2.jpg",
#     "port3.png",
#     "quinta_img-removebg-preview.png",
#     "salada.png",
#     "twitter.png",
#     "uni.png",
#     "vila_don_img-removebg-preview.png",
#     "viladonpatto-img2.jpg",
#     "viladonpatto_background.jpg",
#     "viladonpatto_img1.jpg",
#     "viladonpatto_img3.jpg",
#     "viladonpatto_img4.jpg"
#   ]
# }