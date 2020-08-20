//
//  MyMovieVC.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class MyMovieVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {

   var screenSize: CGRect = UIScreen.main.bounds
   var screenWidth: CGFloat = 0.0
   var screenHeight: CGFloat = 0.0
   var mainView = UIView()

   var viewBg = UIView()
   var tableViewListing: UITableView!
   var arrayTitle = [String]()
   @IBOutlet weak var lblTitale: UILabel!
    
override func viewDidLoad() {
    super.viewDidLoad()
    screenWidth = screenSize.width
    screenHeight = screenSize.height
    arrayTitle = ["MEMBERSHIP PLAN","SILVER PLAN","GOLD PLAN","DIAMOND PLAN"]

    
    mainView.frame = CGRect(x: 0, y: 70, width: screenWidth, height: screenHeight-160  );
    mainView.backgroundColor = UIColor(red:215.0 / 255.0, green:215.0 / 255.0, blue:215.0 / 255.0, alpha: 1.0)
    mainView.layer.cornerRadius = 5
    mainView.clipsToBounds = true
    self.view.addSubview(mainView)
    
    registerNibs()
}
          
     func registerNibs() {
            tableViewListing = UITableView()
        tableViewListing.frame = CGRect(x: 0, y: 0 , width: screenWidth, height:mainView.frame.height)
            tableViewListing.dataSource=self;
            tableViewListing.delegate=self;
            tableViewListing.bounces=true
            tableViewListing.backgroundColor = UIColor.white
            tableViewListing.separatorStyle = .none
            tableViewListing.register(UINib(nibName: "MyMovieCell", bundle: nil), forCellReuseIdentifier: "MyMovieCell")
            mainView.addSubview(tableViewListing)
        
      }
          // MARK: - TableView Method
              func numberOfSections(in tableView: UITableView) -> Int {
                  return 1
              }
              func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
                 return 4
              }
              func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
                              return UITableView.automaticDimension

              }
              func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                 return 240
              }
              func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                  return 0
              }
              func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 if let cell = tableView.dequeueReusableCell(withIdentifier:"MyMovieCell", for: indexPath as IndexPath) as? MyMovieCell {
                  if indexPath.row == 0{
                      let viewBG = UIView()
                      viewBG.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 235  );
                      viewBG.backgroundColor = UIColor(red:255.0 / 255.0, green:255.0 / 255.0, blue:255.0 / 255.0, alpha: 1.0)
                      viewBG.layer.cornerRadius = 5
                      viewBG.clipsToBounds = true
                      cell.addSubview(viewBG)
                      
                      let imageProduct: UIImageView! = UIImageView()
                      imageProduct.frame = CGRect(x: 0, y: 0, width: screenWidth, height:125)
                      imageProduct.image = UIImage(named: "traile.jpeg")
                      imageProduct.contentMode = .scaleAspectFill
                      imageProduct.clipsToBounds = true
                      imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
                      viewBG.addSubview(imageProduct)
                    
                    let likeButton = UIButton()
                    likeButton.frame = CGRect(x: 16, y: imageProduct.frame.maxY+10, width: 20, height: 20)
                    let image = UIImage(named: "like.png")?.withRenderingMode(.alwaysTemplate)
                    likeButton.setImage(image, for: .normal)
                    likeButton.tintColor = UIColor.red
                    likeButton.addTarget(self, action: #selector(self.likeButton), for: .touchUpInside)
                    viewBG.addSubview(likeButton)

                     let lblLike = UILabel()
                     lblLike.frame = CGRect(x: likeButton.frame.maxX, y: imageProduct.frame.maxY+10, width: 20, height: 20);
                     lblLike.text = "2k";
                     lblLike.textAlignment = .center
                     lblLike.font = UIFont.boldSystemFont(ofSize: 14)
                     lblLike.textColor = UIColor.gray
                     viewBG.addSubview(lblLike)

                    let eyeButton = UIButton()
                    eyeButton.frame = CGRect(x: screenWidth-60, y: imageProduct.frame.maxY+10, width: 20, height: 20)
                    let image1 = UIImage(named: "eye.png")?.withRenderingMode(.alwaysTemplate)
                    eyeButton.setImage(image1, for: .normal)
                    eyeButton.tintColor = UIColor.red
                    eyeButton.addTarget(self, action: #selector(self.eyeButton), for: .touchUpInside)
                    viewBG.addSubview(eyeButton)

                    let lblEye = UILabel()
                    lblEye.frame = CGRect(x:  eyeButton.frame.maxX, y: imageProduct.frame.maxY+10, width: 20, height: 20);
                    lblEye.text = "5k";
                    lblEye.textAlignment = .center
                    lblEye.font = UIFont.boldSystemFont(ofSize: 14)
                    lblEye.textColor = UIColor.black
                    viewBG.addSubview(lblEye)

                    let lblName = UILabel()
                    lblName.frame = CGRect(x: 16, y: likeButton.frame.maxY+5, width: screenWidth-32, height: 20);
                    lblName.text = "Sriniwasa Kalyanam(Hindi)3D";
                    lblName.textAlignment = .left
                    lblName.font = UIFont.boldSystemFont(ofSize: 14)
                    lblName.textColor = UIColor.black
                    viewBG.addSubview(lblName)

                    let lblRDate = UILabel()
                    lblRDate.frame = CGRect(x: 16, y: lblName.frame.maxY+1, width:80, height: 20);
                    lblRDate.text = "Releasing date:";
                    lblRDate.textAlignment = .left
                    lblRDate.font = UIFont.boldSystemFont(ofSize: 10)
                    lblRDate.textColor = UIColor.black
                    viewBG.addSubview(lblRDate)

                    let lblRDate1 = UILabel()
                    lblRDate1.frame = CGRect(x: lblRDate.frame.maxX, y: lblName.frame.maxY+1, width:100, height: 20);
                    lblRDate1.text = "12 june 2020";
                    lblRDate1.textAlignment = .left
                    lblRDate1.font = UIFont.boldSystemFont(ofSize: 10)
                    lblRDate1.textColor = UIColor.gray
                    viewBG.addSubview(lblRDate1)

                    let lblCensor = UILabel()
                    lblCensor.frame = CGRect(x: 16, y: lblRDate.frame.maxY+1, width:40, height: 20);
                    lblCensor.text = "Censor:";
                    lblCensor.textAlignment = .left
                    lblCensor.font = UIFont.boldSystemFont(ofSize: 10)
                    lblCensor.textColor = UIColor.black
                    viewBG.addSubview(lblCensor)

                    let lblCensor1 = UILabel()
                    lblCensor1.frame = CGRect(x: lblCensor.frame.maxX, y: lblRDate.frame.maxY+1, width:100, height: 20);
                    lblCensor1.text = "A";
                    lblCensor1.textAlignment = .left
                    lblCensor1.font = UIFont.boldSystemFont(ofSize: 10)
                    lblCensor1.textColor = UIColor.gray
                    viewBG.addSubview(lblCensor1)

                  }
                    if indexPath.row == 1{
                      let viewBg1 = UIView()
                      viewBg1.frame = CGRect(x: 0, y: 3, width: screenWidth, height: 235);
                      viewBg1.backgroundColor = UIColor.white
                      cell.addSubview(viewBg1)
                         
                      let starCast = UILabel()
                      starCast.frame = CGRect(x: 16, y: 0, width:55   , height: 30);
                      starCast.text = "Star Cast:";
                      starCast.font = UIFont.boldSystemFont(ofSize: 10)
                      starCast.textColor = UIColor.black
                      viewBg1.addSubview(starCast)
                      
                      let starCastName = UILabel()
                      starCastName.frame = CGRect(x: starCast.frame.maxX, y: 0, width:150, height: 30);
                      starCastName.text = "Star Cast:";
                      starCastName.font = UIFont.boldSystemFont(ofSize: 10)
                      starCastName.textColor = UIColor.gray
                      viewBg1.addSubview(starCastName)
                         
                      let director = UILabel()
                      director.frame = CGRect(x: 16, y: starCast.frame.maxY+2, width:55   , height: 30);
                      director.text = "Director:";
                      director.font = UIFont.boldSystemFont(ofSize: 10)
                      director.textColor = UIColor.black
                      viewBg1.addSubview(director)
                      
                      let directorName = UILabel()
                      directorName.frame = CGRect(x: director.frame.maxX, y: starCast.frame.maxY+2, width:150, height: 30);
                      directorName.text = "DirectorName:";
                      directorName.font = UIFont.boldSystemFont(ofSize: 10)
                      directorName.textColor = UIColor.gray
                      viewBg1.addSubview(directorName)

                      let musicDirector = UILabel()
                      musicDirector.frame = CGRect(x: 16, y: director.frame.maxY+2, width:80   , height: 30);
                      musicDirector.text = "Music Director:";
                      musicDirector.font = UIFont.boldSystemFont(ofSize: 10)
                      musicDirector.textColor = UIColor.black
                      viewBg1.addSubview(musicDirector)
                      
                      let musicDirectorName = UILabel()
                      musicDirectorName.frame = CGRect(x: musicDirector.frame.maxX, y: directorName.frame.maxY+2, width:150, height: 30);
                      musicDirectorName.text = "DirectorName:";
                      musicDirectorName.font = UIFont.boldSystemFont(ofSize: 10)
                      musicDirectorName.textColor = UIColor.gray
                      viewBg1.addSubview(musicDirectorName)
                      
                      let producer = UILabel()
                      producer.frame = CGRect(x: 16, y: musicDirector.frame.maxY+2, width:55   , height: 30);
                      producer.text = "Producer:";
                      producer.font = UIFont.boldSystemFont(ofSize: 10)
                      producer.textColor = UIColor.black
                      viewBg1.addSubview(producer)
                      
                      let producerName = UILabel()
                      producerName.frame = CGRect(x: producer.frame.maxX, y: musicDirector.frame.maxY+2, width:150, height: 30);
                      producerName.text = "Navasan";
                      producerName.font = UIFont.boldSystemFont(ofSize: 10)
                      producerName.textColor = UIColor.gray
                      viewBg1.addSubview(producerName)
                      
                      let genres = UILabel()
                      genres.frame = CGRect(x: 16, y: producer.frame.maxY+2, width:50   , height: 30);
                      genres.text = "Genres:";
                      genres.font = UIFont.boldSystemFont(ofSize: 10)
                      genres.textColor = UIColor.black
                      viewBg1.addSubview(genres)
                      
                      let genresName = UILabel()
                      genresName.frame = CGRect(x: genres.frame.maxX, y: producerName.frame.maxY+2, width:150, height: 30);
                      genresName.text = "Family/Drama";
                      genresName.font = UIFont.boldSystemFont(ofSize: 10)
                      genresName.textColor = UIColor.gray
                      viewBg1.addSubview(genresName)
                      
                      
                      let MovieRTime = UILabel()
                      MovieRTime.frame = CGRect(x: 16, y: genres.frame.maxY+2, width:100   , height: 30);
                      MovieRTime.text = "Movie Runing Time:";
                      MovieRTime.font = UIFont.boldSystemFont(ofSize: 10)
                      MovieRTime.textColor = UIColor.black
                      viewBg1.addSubview(MovieRTime)
                      
                      let MovieRTime1 = UILabel()
                      MovieRTime1.frame = CGRect(x: MovieRTime.frame.maxX, y: genresName.frame.maxY+2, width:150, height: 30);
                      MovieRTime1.text = "120 Min.";
                      MovieRTime1.font = UIFont.boldSystemFont(ofSize: 10)
                      MovieRTime1.textColor = UIColor.gray
                      viewBg1.addSubview(MovieRTime1)
                      
                      let banner = UILabel()
                      banner.frame = CGRect(x: 16, y: MovieRTime.frame.maxY+2, width:50   , height: 30);
                      banner.text = "Banner:";
                      banner.font = UIFont.boldSystemFont(ofSize: 10)
                      banner.textColor = UIColor.black
                      viewBg1.addSubview(banner)
                      
                      let bannerName = UILabel()
                      bannerName.frame = CGRect(x: banner.frame.maxX, y: MovieRTime1.frame.maxY+2, width:250, height: 30);
                      bannerName.text = "SRI LAKSHMI VRUSHADHARI PRODUCTION";
                      bannerName.font = UIFont.boldSystemFont(ofSize: 10)
                      bannerName.textColor = UIColor.gray
                      viewBg1.addSubview(bannerName)
                        
                    }
                    if indexPath.row == 2{
                      let viewBg1 = UIView()
                      viewBg1.frame = CGRect(x: 0, y: 3, width: screenWidth, height: 235);
                      viewBg1.backgroundColor = UIColor.white
                      cell.addSubview(viewBg1)
                         
                      let AboutMovie = UILabel()
                      AboutMovie.frame = CGRect(x: 16, y: 0, width:screenWidth-32   , height: 25);
                      AboutMovie.text = "About the Movie";
                      AboutMovie.font = UIFont.boldSystemFont(ofSize: 10)
                      AboutMovie.textColor = UIColor.black
                      viewBg1.addSubview(AboutMovie)
                      
                      let AboutMovieURL = UILabel()
                      AboutMovieURL.frame = CGRect(x: 16, y: AboutMovie.frame.maxY+2, width:screenWidth-32, height: 25);
                      AboutMovieURL.text = "https:g.co/kgs/mo451c";
                      AboutMovieURL.font = UIFont.boldSystemFont(ofSize: 10)
                      AboutMovieURL.textColor = UIColor.red
                      viewBg1.addSubview(AboutMovieURL)
                         
                      
                     let trailerLink = UILabel()
                     trailerLink.frame = CGRect(x: 16, y:  AboutMovieURL.frame.maxY+2, width:screenWidth-32   , height: 25);
                     trailerLink.text = "Trailer Link";
                     trailerLink.font = UIFont.boldSystemFont(ofSize: 10)
                     trailerLink.textColor = UIColor.black
                     viewBg1.addSubview(trailerLink)
                                     
                     let trailerLinkURL = UILabel()
                     trailerLinkURL.frame = CGRect(x: 16, y: trailerLink.frame.maxY+2, width:screenWidth-32, height: 25);
                     trailerLinkURL.text = "https:g.co/kgs/mo451c";
                     trailerLinkURL.font = UIFont.boldSystemFont(ofSize: 10)
                     trailerLinkURL.textColor = UIColor.red
                     viewBg1.addSubview(trailerLinkURL)
                        
                     let songs = UILabel()
                     songs.frame = CGRect(x: 16, y:  trailerLinkURL.frame.maxY+2, width:screenWidth-32   , height: 25);
                     songs.text = "Songs";
                     songs.font = UIFont.boldSystemFont(ofSize: 10)
                     songs.textColor = UIColor.black
                     viewBg1.addSubview(songs)
                                         
                     let songsURL = UILabel()
                     songsURL.frame = CGRect(x: 16, y: songs.frame.maxY+2, width:screenWidth-32, height: 25);
                     songsURL.text = "https:g.co/kgs/mo451c";
                     songsURL.font = UIFont.boldSystemFont(ofSize: 10)
                     songsURL.textColor = UIColor.red
                     viewBg1.addSubview(songsURL)

                    let making = UILabel()
                    making.frame = CGRect(x: 16, y:  songsURL.frame.maxY+2, width:screenWidth-32   , height: 25);
                    making.text = "Making";
                    making.font = UIFont.boldSystemFont(ofSize: 10)
                    making.textColor = UIColor.black
                    viewBg1.addSubview(making)
                                
                   let makingURL = UILabel()
                   makingURL.frame = CGRect(x: 16, y: making.frame.maxY+2, width:screenWidth-32, height: 25);
                   makingURL.text = "https:g.co/kgs/mo451c";
                   makingURL.font = UIFont.boldSystemFont(ofSize: 10)
                   makingURL.textColor = UIColor.red
                   viewBg1.addSubview(makingURL)
                        
                    }
                  if indexPath.row == 3{
                      let viewBg2 = UIView()
                      viewBg2.frame = CGRect(x: 0, y: 3, width: screenWidth, height: 240);
                      viewBg2.backgroundColor = UIColor.white
                      cell.addSubview(viewBg2)
                         
                      let synopsis = UILabel()
                      synopsis.frame = CGRect(x: 16, y: 0, width:screenWidth-32   , height: 30);
                      synopsis.text = "SYNOPSIS";
                      synopsis.font = UIFont.boldSystemFont(ofSize: 14)
                      synopsis.textColor = UIColor.black
                      viewBg2.addSubview(synopsis)
                      
                      let lblDescription = UILabel()
                      lblDescription.frame = CGRect(x: 16, y: synopsis.frame.maxY+2, width:screenWidth-32, height: 80);
                      lblDescription.text = "jkhdhsiugyhiughdfkjghsdkjfghysdkjfghsdghdjghjdjhgdfjhhjkdfhjkdfhjkdfhjkdhjkdfhjdfhjkdfhjkdfhjkdfhjkdfhjkjkhfdkhjfdkhjf4uoitioutiruio;rtiourkjrtiuojkhfjkhfgjkfdjkldfskhjhjkfhjk,";
                      lblDescription.numberOfLines = 15
                      lblDescription.font = UIFont.boldSystemFont(ofSize: 10)
                      lblDescription.textColor = UIColor.gray
                      viewBg2.addSubview(lblDescription)
                    
                      let contactPerson = UIButton()
                      contactPerson.frame = CGRect(x: 16, y: lblDescription.frame.maxY+10, width: screenWidth - 32, height: 50)
                    contactPerson.setTitle("CONTACT PERSON", for: .normal)
                    contactPerson.setTitleColor(.white, for: .normal)
                    contactPerson.titleLabel?.textAlignment = .center
                    contactPerson.backgroundColor = UIColor.red
                    contactPerson.layer.cornerRadius = 8.0
                    contactPerson.clipsToBounds = true
                    contactPerson.addTarget(self, action: #selector(self.contactPerson), for: .touchUpInside)
                    viewBg2.addSubview(contactPerson)
                    
                      let theatreList = UIButton()
                      theatreList.frame = CGRect(x: 0, y: contactPerson.frame.maxY+20, width: screenWidth, height: 50)
                    theatreList.setTitle("THEATRE LIST", for: .normal)
                    theatreList.setTitleColor(.white, for: .normal)
                    theatreList.titleLabel?.textAlignment = .center
                    theatreList.backgroundColor = UIColor.red
                    theatreList.layer.cornerRadius = 0
                    theatreList.clipsToBounds = true
                    theatreList.addTarget(self, action: #selector(self.theatreList), for: .touchUpInside)
                    viewBg2.addSubview(theatreList)

                    }
                  
                  
                     return cell
                 }
                   return UITableViewCell()

              }
    @objc func contactPerson() {
           
       }
    @objc func theatreList() {
           
       }
   @objc func likeButton() {
                     
    }
    
    @objc func eyeButton() {
           
       }
    

    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func btnLocation(_ sender: Any) {
       }
    @IBAction func btnAdd(_ sender: Any) {
       }
    @IBAction func btnNotification(_ sender: Any) {
        }
}
