
library(shiny)
library(data.table)
library(readxl)

library(shiny)
library(shinythemes)

shinyUI(fluidPage(navbarPage("Triz Studies", id = "navbarID", theme = shinytheme("cerulean"),
                             
                             tabPanel("TRIZ 39", value = "triz_39",
                                      #titlePanel('TRIZ 39'),
                                      # Input values
                                      sidebarPanel(
                                        HTML("<h3>Matrix 39 Thông Số</h3>"),
                                        
                                        selectInput("outlook1", label = "Thông số tăng (tốt lên):", 
                                                    choices = list("1. Trọng lượng đối tượng chuyển động"=1,
                                                                   "2. Trọng lượng đối tượng bất động"=2,
                                                                   "3. Độ dài đối tượng chuyển động"=3,
                                                                   "4. Độ dài đối tượng bất động"=4,
                                                                   "5. Diện tích đối tượng chuyển động"=5,
                                                                   "6. Diện tích đối tượng bất động"=6,
                                                                   "7. Thể tích đối tượng chuyển động"=7,
                                                                   "8. Thể tích đối tượng bất động"=8,
                                                                   "9. Vận tốc"=9,
                                                                   "10. Lực"=10,
                                                                   "11. Ứng suất, áp suất"=11,
                                                                   "12. Hình dạng"=12,
                                                                   "13. Tính ổn định của thành phần đối tượng"=13,
                                                                   "14. Độ bền"=14,
                                                                   "15. Thời hạn hoạt động của đối tượng chuyển động"=15,
                                                                   "16. Thời hạn hoạt động của đối tượng bất động"=16,
                                                                   "17. Nhiệt độ"=17,
                                                                   "18. Độ chiếu sáng (độ rọi)"=18,
                                                                   "19. Năng lượng tiêu hao bởi đối tượng chuyển động"=19,
                                                                   "20. Năng lượng tiêu hao bởi đối tượng bất động"=20,
                                                                   "21.Công suất"=21,
                                                                   "22. Năng lượng mất mát"=22,
                                                                   "23. Chất thể mất mát"=23,
                                                                   "24. Thông tin mất mát"=24,
                                                                   "25. Thời gian mất mát"=25,
                                                                   "26. Lượng chất thể"=26,
                                                                   "27. Độ tin cậy"=27,
                                                                   "28. Độ chính xác trong đo lường"=28,
                                                                   "29. Độ chính xác trong chế tạo"=29,
                                                                   "30. Các nhân tố có hại từ bên ngoài tác động lên đối tượng"=30,
                                                                   "31. Các nhân tố có hại sinh ra bởi chính đối tượng"=31,
                                                                   "32. Tiện lợi trong chế tạo"=32,
                                                                   "33. Tiện lợi trong sử dụng, vận hành"=33,
                                                                   "34. Tiện lợi trong sửa chữa"=34,
                                                                   "35. Độ thích nghi, tính phổ dụng (vạn năng)"=35,
                                                                   "36. Độ phức tạp của thiết bị"=36,
                                                                   "37. Độ phức tạp trong kiểm tra và đo lường"=37,
                                                                   "38. Mức độ tự động hóa"=38,
                                                                   "39. Năng suất"=39), 
                                                    selected = "1. Trọng lượng đối tượng chuyển động"),
                                        
                                        selectInput("windy1", label = "Thông số giảm (xấu đi):", 
                                                    choices = list("1. Trọng lượng đối tượng chuyển động"=1,
                                                                   "2. Trọng lượng đối tượng bất động"=2,
                                                                   "3. Độ dài đối tượng chuyển động"=3,
                                                                   "4. Độ dài đối tượng bất động"=4,
                                                                   "5. Diện tích đối tượng chuyển động"=5,
                                                                   "6. Diện tích đối tượng bất động"=6,
                                                                   "7. Thể tích đối tượng chuyển động"=7,
                                                                   "8. Thể tích đối tượng bất động"=8,
                                                                   "9. Vận tốc"=9,
                                                                   "10. Lực"=10,
                                                                   "11. Ứng suất, áp suất"=11,
                                                                   "12. Hình dạng"=12,
                                                                   "13. Tính ổn định của thành phần đối tượng"=13,
                                                                   "14. Độ bền"=14,
                                                                   "15. Thời hạn hoạt động của đối tượng chuyển động"=15,
                                                                   "16. Thời hạn hoạt động của đối tượng bất động"=16,
                                                                   "17. Nhiệt độ"=17,
                                                                   "18. Độ chiếu sáng (độ rọi)"=18,
                                                                   "19. Năng lượng tiêu hao bởi đối tượng chuyển động"=19,
                                                                   "20. Năng lượng tiêu hao bởi đối tượng bất động"=20,
                                                                   "21.Công suất"=21,
                                                                   "22. Năng lượng mất mát"=22,
                                                                   "23. Chất thể mất mát"=23,
                                                                   "24. Thông tin mất mát"=24,
                                                                   "25. Thời gian mất mát"=25,
                                                                   "26. Lượng chất thể"=26,
                                                                   "27. Độ tin cậy"=27,
                                                                   "28. Độ chính xác trong đo lường"=28,
                                                                   "29. Độ chính xác trong chế tạo"=29,
                                                                   "30. Các nhân tố có hại từ bên ngoài tác động lên đối tượng"=30,
                                                                   "31. Các nhân tố có hại sinh ra bởi chính đối tượng"=31,
                                                                   "32. Tiện lợi trong chế tạo"=32,
                                                                   "33. Tiện lợi trong sử dụng, vận hành"=33,
                                                                   "34. Tiện lợi trong sửa chữa"=34,
                                                                   "35. Độ thích nghi, tính phổ dụng (vạn năng)"=35,
                                                                   "36. Độ phức tạp của thiết bị"=36,
                                                                   "37. Độ phức tạp trong kiểm tra và đo lường"=37,
                                                                   "38. Mức độ tự động hóa"=38,
                                                                   "39. Năng suất"=39), 
                                                    selected = "1. Trọng lượng đối tượng chuyển động"),
                                        
                                        selectInput("vidu1", label = "Ví Dụ Trong Lĩnh Vực:", 
                                                    choices = list("1. Kỹ thuật"="triz_pd.csv",
                                                                   "2. Công nghệ thực phẩm"="food.csv",
                                                                   "3. Kinh tế"="economics_triz.csv"),
                                                    selected = "1. Kỹ thuật"),
                                        
                                        #selectInput("database1", label = "Matrix:", 
                                        #            choices = list("39 Thông Số"="triz.xlsx"),
                                        #            selected = "1. Kỹ thuật"),                                          
                                        actionButton("submitbutton1", "Submit", class = "btn btn-primary")
                                      ),
                                      
                                      mainPanel(
                                        tags$label(h3('Status/Output')),#textOutput("value39"), # Status/Output Text Box
                                        #verbatimTextOutput('content1'),
                                        tableOutput('mymatrix1') # Results table
                                      ) # mainPanel()
                                      
                             ) ,# tabPanel1,
                             
                             
)))



# Read data
my_data1 <- read_excel("triz_39.xlsx")
my_data2 <- read_excel("triz_45.xlsx")
my_data3 <- read_excel("triz_50.xlsx")
my_data7 <- read_excel("aa.xlsx")

shinyServer(function(input, output, session) {
        ####################
        observeEvent(getQueryString(session)$page, {
                currentQueryString <- getQueryString(session)$page # alternative: parseQueryString(session$clientData$url_search)$page
                if(is.null(input$navbarID) || !is.null(currentQueryString) && currentQueryString != input$navbarID){
                        freezeReactiveValue(input, "navbarID")
                        updateNavbarPage(session, "navbarID", selected = currentQueryString)}}, priority = 1)
        
        observeEvent(input$navbarID, {
                currentQueryString <- getQueryString(session)$page # alternative: parseQueryString(session$clientData$url_search)$page
                pushQueryString <- paste0("?page=", input$navbarID)
                if(is.null(currentQueryString) || currentQueryString != input$navbarID){
                        freezeReactiveValue(input, "navbarID")
                        updateQueryString(pushQueryString, mode = "push", session)}}, priority = 0)
        
        #####################
        
        datasetInput1 <-reactive({ 
                b <- strtoi(input$outlook1)
                a <- strtoi(input$windy1)
                v <- unlist(my_data1[a,b])
                bmi<-as.list(strsplit(v, "[,]")[[1]])
                bmi <- unlist(transpose(bmi))
                v <-read.csv("aa.csv", header = TRUE)
                b <- c()
                for (x in bmi) {b=c(b,v[x,1])}
                vv <-read.csv(input$vidu1, header = TRUE,sep =';' )
                bb1 <- c()
                for (x in bmi) {bb1=c(bb1,vv[x,1])}
                emp <- data.frame(
                        No = bmi,
                        "Thủ_Thuật_Sáng_Tạo" = b, 
                        "Ví_Dụ" = bb1,
                        stringsAsFactors = FALSE)})
        output$mymatrix1 <- renderTable({if (input$submitbutton1>0) {isolate(datasetInput1()) }},bordered = TRUE, sanitize.text.function=identity)                 
        ################################        
     
        
})
