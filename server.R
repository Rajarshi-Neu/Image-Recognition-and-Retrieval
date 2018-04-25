library(shiny)

shinyServer(function(input,output){
  data <- reactive(
    {
      file1 <- input$file1 #Reads the input  file
      if(is.null(file1)){return()}
      mypic<- readImage(file=file1$datapath)
      return(mypic) #returns the img
    }
  )
  
  #the next function calls the input images and resizes and reshapes it
  filtered.image <- reactive({
    img <- data()
    img <- resize(img, 50, 50)
    img <- array_reshape(img, c(50*50*3))
    img <-  t(as.data.frame(img))
    return(img)
    print("filtered image")
  })
  
  #the following function reads the data from the training data set. Please make sure you have the data folder downloaded into the working directory
  data.modelling <- reactive({
    library(digest)
    library(EBImage)
    library(Rcpp)
    library(keras)
    

    files <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/0", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic1 <- list()
    for (i in 1:length(files))
    {
      mypic1[[i]] <- readImage(paste("data/0/",trimws(files[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files))
    {
      mypic1[[i]] <- resize(mypic1[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files))
    {
      mypic1[[i]] <- array_reshape(mypic1[[i]], c(50*50*3)) 
    }
    
    
    
    
    files2 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/1", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic2 <- list()
    for (i in 1:length(files2))
    {
      mypic2[[i]] <- readImage(paste("data/1/",trimws(files2[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files2))
    {
      mypic2[[i]] <- resize(mypic2[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files2))
    {
      mypic2[[i]] <- array_reshape(mypic2[[i]], c(50*50*3)) 
    }
    
    
    files3 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/2", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic3 <- list()
    for (i in 1:length(files3))
    {
      mypic3[[i]] <- readImage(paste("data/2/",trimws(files3[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files3))
    {
      mypic3[[i]] <- resize(mypic3[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files3))
    {
      mypic3[[i]] <- array_reshape(mypic3[[i]], c(50*50*3)) 
    }
    
    
    
    files4 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/3", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic4 <- list()
    for (i in 1:length(files4))
    {
      mypic4[[i]] <- readImage(paste("data/3/",trimws(files4[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files4))
    {
      mypic4[[i]] <- resize(mypic4[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files4))
    {
      mypic4[[i]] <- array_reshape(mypic4[[i]], c(50*50*3)) 
    }
    
   
    
    files5 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/4", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic5 <- list()
    for (i in 1:length(files5))
    {
      mypic5[[i]] <- readImage(paste("data/4/",trimws(files5[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files5))
    {
      mypic5[[i]] <- resize(mypic5[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files5))
    {
      mypic5[[i]] <- array_reshape(mypic5[[i]], c(50*50*3)) 
    }
    
    
    
    files6 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/5", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic6 <- list()
    for (i in 1:length(files6))
    {
      mypic6[[i]] <- readImage(paste("data/5/",trimws(files6[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files6))
    {
      mypic6[[i]] <- resize(mypic6[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files6))
    {
      mypic6[[i]] <- array_reshape(mypic6[[i]], c(50*50*3)) 
    }
    
    
    files7 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/6", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic7 <- list()
    for (i in 1:length(files7))
    {
      mypic7[[i]] <- readImage(paste("data/6/",trimws(files7[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files7))
    {
      mypic7[[i]] <- resize(mypic7[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files7))
    {
      mypic7[[i]] <- array_reshape(mypic7[[i]], c(50*50*3)) 
    }
    
    
    
    files8 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/7", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic8 <- list()
    for (i in 1:length(files8))
    {
      mypic8[[i]] <- readImage(paste("data/7/",trimws(files8[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files8))
    {
      mypic8[[i]] <- resize(mypic8[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files8))
    {
      mypic8[[i]] <- array_reshape(mypic8[[i]], c(50*50*3)) 
    }
    
   
    
    files9 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/8", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic9 <- list()
    for (i in 1:length(files9))
    {
      mypic9[[i]] <- readImage(paste("data/8/",trimws(files9[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files9))
    {
      mypic9[[i]] <- resize(mypic9[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files9))
    {
      mypic9[[i]] <- array_reshape(mypic9[[i]], c(50*50*3)) 
    }
    
    
    
    files10 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/9", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic10 <- list()
    for (i in 1:length(files10))
    {
      mypic10[[i]] <- readImage(paste("data/9/",trimws(files10[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files10))
    {
      mypic10[[i]] <- resize(mypic10[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files10))
    {
      mypic10[[i]] <- array_reshape(mypic10[[i]], c(50*50*3)) 
    }
    
    
    files11 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/10", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic11 <- list()
    for (i in 1:length(files11))
    {
      mypic11[[i]] <- readImage(paste("data/10/",trimws(files11[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files11))
    {
      mypic11[[i]] <- resize(mypic11[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files11))
    {
      mypic11[[i]] <- array_reshape(mypic11[[i]], c(50*50*3)) 
    }
    
    
    
    
    files12 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/11", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic12 <- list()
    for (i in 1:length(files12))
    {
      mypic12[[i]] <- readImage(paste("data/11/",trimws(files12[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files12))
    {
      mypic12[[i]] <- resize(mypic12[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files12))
    {
      mypic12[[i]] <- array_reshape(mypic12[[i]], c(50*50*3)) 
    }
    
    
    
    
    files13 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/12", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic13 <- list()
    for (i in 1:length(files13))
    {
      mypic13[[i]] <- readImage(paste("data/12/",trimws(files13[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files13))
    {
      mypic13[[i]] <- resize(mypic13[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files13))
    {
      mypic13[[i]] <- array_reshape(mypic13[[i]], c(50*50*3)) 
    }
    
    
    
    files14 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/13", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic14 <- list()
    for (i in 1:length(files14))
    {
      mypic14[[i]] <- readImage(paste("data/13/",trimws(files14[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files14))
    {
      mypic14[[i]] <- resize(mypic14[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files14))
    {
      mypic14[[i]] <- array_reshape(mypic14[[i]], c(50*50*3)) 
    }
    
    
    
    files15 <- list.files(path="C:/Users/Rajarshi/Desktop/Machine Learning/Project/data/14", pattern=".jpg",all.files=T, full.names=F, no.. = T)  
    
    mypic15 <- list()
    for (i in 1:length(files15))
    {
      mypic15[[i]] <- readImage(paste("data/14/",trimws(files15[i]), sep=""))
    }
    
    #Resize
    for (i in 1:length(files15))
    {
      mypic15[[i]] <- resize(mypic15[[i]], 50, 50)
    }
    
    #Reshape
    for (i in 1:length(files15))
    {
      mypic15[[i]] <- array_reshape(mypic15[[i]], c(50*50*3)) 
    }
    
    
    
    
    blouse <- t(as.data.frame(mypic1))
    cloak <- t(as.data.frame(mypic2))
    coat <- t(as.data.frame(mypic3))
    jacket <- t(as.data.frame(mypic4))
    longdress <- t(as.data.frame(mypic5))
    polo <- t(as.data.frame(mypic6))
    robe <- t(as.data.frame(mypic7))
    shirt <- t(as.data.frame(mypic8))
    shortdress <- t(as.data.frame(mypic9))
    suit <- t(as.data.frame(mypic10))
    sweater <- t(as.data.frame(mypic11))
    tee <- t(as.data.frame(mypic12))
    undergarment <- t(as.data.frame(mypic13))
    uniform <- t(as.data.frame(mypic14))
    waistcoat <- t(as.data.frame(mypic15))
    
   
   
    
    
    a <- rep(0:14, each = 20)
    
    print("yo")
    
    b <- as.data.frame(a)
    colnames(b) <- "Pred"
    print("yo2")
    
    j <- rbind(blouse, cloak, coat, jacket, longdress, polo, robe, shirt, shortdress, suit, sweater, tee, undergarment, uniform, waistcoat)
    
    zz <- as.data.frame(j)
    g <- cbind(b,zz)
    print("j")
    
    
    
    train <- g
    return(train)
  })
  
  
  #the randomfor() function predicts the image type using random forest algorithm.
  randomfor <- reactive({
    
    print("inside random forest")
    
    #library(mlogit)
    library(nnet)
    library(caret)
    
    library(randomForest)
    train_rf <- data.modelling()
    print("train_rf")
    test_rf <- filtered.image()
    print("test_rf")
    train_rf$Pred <-factor(train_rf$Pred)
    print(train_rf$Pred)
    #test_rf$Pred <-factor(test_rf$Pred)
    #print(test_rf$Pred)
    rf <- randomForest(Pred ~ .,data = train_rf)
    print("rf")
    #q1 <- predict(rf, train_rf)
    q2 <- predict(rf, test_rf)
    
    if(q2==0 )
    {
      print(q2)
      q2<- "Blouse"
    }
    else if(q2==1)
    {
      print(q2)
      q2 <- "cloak"
    }
    else if(q2==2)
    {
      print(q2)
      q2 <- "coat"
    }
    else if(q2==3)
    {
      print(q2)
      q2 <- "jacket"
    }
    else if(q2==4)
    {
      print(q2)
      q2 <- "longdress"
    }
    else if(q2==5)
    {
      print(q2)
      q2 <- "polo tshirt"
    }
    else if(q2==6)
    {
      print(q2)
      q2 <- "robe"
    }
    else if(q2==7)
    {
      print(q2)
      q2 <- "shirt"
    }
    else if(q2==8)
    {
      print(q2)
      q2 <- "shortdress"
    }
    else if(q2==9)
    {
      print(q2)
      q2 <- "suit"
    }
    else if(q2==10)
    {
      print(q2)
      q2 <- "sweater"
    }
    else if(q2==11)
    {
      print(q2)
      q2 <- "tee"
    }
    else if(q2==12)
    {
      print(q2)
      q2 <- "undergarment"
    }
    else if(q2==13)
    {
      print(q2)
      q2 <- "uniform"
    }
    else if(q2==14)
    {
      print(q2)
      q2 <- "waistcoat"
    }
    else
    {
      q2="Please Retry"
    }
    
    print("q2")
    print("done with random forest")
    return(q2)
    
    
  })
  
  #the sv() function predicts the image type using svm algorithm.
  sv <- reactive({
    library(e1071)
    train_rf <- data.modelling()
    print("train_rf")
    test_rf <- filtered.image()
    print("test_rf")
    train_rf$Pred <-factor(train_rf$Pred)
    print(train_rf$Pred)
    #test_rf$Pred <-factor(test_rf$Pred)
    #print(test_rf$Pred)
    modelsvm_after_tune <- svm(Pred ~ ., data=train_rf, kernel="radial", 
                               cost=0.1, gamma=0.5)
    summary(modelsvm_after_tune)
    #pred_svm3 <- predict(modelsvm_after_tune, train_rf)
    q2 <- predict(modelsvm_after_tune, test_rf)
    
    if(q2==0 )
      if(q2==0 )
      {
        print(q2)
        q2<- "Blouse"
      }
    else if(q2==1)
    {
      print(q2)
      q2 <- "cloak"
    }
    else if(q2==2)
    {
      print(q2)
      q2 <- "coat"
    }
    else if(q2==3)
    {
      print(q2)
      q2 <- "jacket"
    }
    else if(q2==4)
    {
      print(q2)
      q2 <- "longdress"
    }
    else if(q2==5)
    {
      print(q2)
      q2 <- "polo tshirt"
    }
    else if(q2==6)
    {
      print(q2)
      q2 <- "robe"
    }
    else if(q2==7)
    {
      print(q2)
      q2 <- "shirt"
    }
    else if(q2==8)
    {
      print(q2)
      q2 <- "shortdress"
    }
    else if(q2==9)
    {
      print(q2)
      q2 <- "suit"
    }
    else if(q2==10)
    {
      print(q2)
      q2 <- "sweater"
    }
    else if(q2==11)
    {
      print(q2)
      q2 <- "tee"
    }
    else if(q2==12)
    {
      print(q2)
      q2 <- "undergarment"
    }
    else if(q2==13)
    {
      print(q2)
      q2 <- "uniform"
    }
    else if(q2==14)
    {
      print(q2)
      q2 <- "waistcoat"
    }
    else
    {
      q2="Please Retry"
    }
    
    print("q2")
    return(q2)
    
  })
  
  #cn <- reactive({ })
  
  
  #jammer function recognises which algorithm has been asked for by the user and calls the respective function.
  jammer <- reactive({
    print(input$algorithm)
    c <- input$algorithm
    #print(input$algorithm)
    if (c == "Random Forest")
    {
      print(1)
      alg <- randomfor()
      print(2)
    }
    else if (c == "SVM")
    {
      alg <- sv()
    } 
    #else if (c == "CNN")
    #{
     # alg <- cn()
    #} 
    return(alg)
  })
  
  #passing 
  output$myImage <- renderUI({
    print(jammer())
    x <- jammer()
    #x has the type of image we are searching for.
    library(rvest)
    library(tidyverse)
    library(jpeg)
    url <- paste0("https://www.google.nl/search?q=",
                  x,
                  "&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiCjLmPoL_aAhUONd8KHXTuBeYQ_AUoAXoECAAQAw&biw=1707&bih=844")
    
    # x is passed on from the predicting algorithm, which makes the url and subject to change based on input apparel.
    imgsrc <- read_html(url) %>%
      html_node(xpath = '//*/img') %>%
      html_attr('src')
    tags$img(src = imgsrc)  
  })
  
  
  
}
)