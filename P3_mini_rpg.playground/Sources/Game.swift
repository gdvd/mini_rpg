import UIKit
import os.log

protocol PersonDelegate {
    func personWasTapped(person: Person)
    func trunkWasTapped(idButton: Int)
}

public class Game: UIView, PersonDelegate {
    
    
    // MARK: - Element for first view
    var buttonBegin: UIButton!
    var backgroundImageView: UIImageView!
    
    // Elements for createPlayers
    var labelUserName11: UILabel!
    var textFieldUserName11: UITextField!
    var labelPers11: UILabel!
    var textFielPers11: UITextField!
    var img11: UIImageView!
    var labelPers12: UILabel!
    var textFielPers12: UITextField!
    var img12: UIImageView!
    var labelPers13: UILabel!
    var textFielPers13: UITextField!
    var img13: UIImageView!
    var labelUserName21: UILabel!
    var textFieldUserName21: UITextField!
    var labelPers21: UILabel!
    var textFielPers21: UITextField!
    var img21: UIImageView!
    var labelPers22: UILabel!
    var textFielPers22: UITextField!
    var img22: UIImageView!
    var labelPers23: UILabel!
    var textFielPers23: UITextField!
    var img23: UIImageView!
    var buttonCancel: UIButton!
    var buttonPlay: UIButton!
    
    // Players
    var personsOfPlayer1: [Person] = []
    var personsOfPlayer2: [Person] = []
    
    var allButtonPersons: [UIButton]!
    
    // Button Fight
    var buttonfight: UIButton!
    var buttonTrunk: UIButton!
    
    // Indicator to fight
    var personPlayer1Fighting: Int!
    var personPlayer2Fighting: Int!
    var fightIsRunning: Bool = false
    var fightLevel: Int = 0
    var givingAShotIsRunning = false
    var showTrunk1Active: Bool = false
    var showTrunk2Active: Bool = false
    var weaponInTrunk: WeaponsFamily!
    var user1ReadyToFight = 0
    var user2ReadyToFight = 0
    
    var labelForUser1: UILabel!
    var labelForPers11: UILabel!
    var labelForPers12: UILabel!
    var labelForPers13: UILabel!
    var labelForUser2: UILabel!
    var labelForPers21: UILabel!
    var labelForPers22: UILabel!
    var labelForPers23: UILabel!
    
    var greenView: UIView!
    var nbOfFight: Int!
    
    // Game Over
    var buttonGameover: UIButton!
    var labelGameover: UILabel!
    var isGameOver = false
    
    // MARK: - 1 Init
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: Constants.sizeCanvasWidth, height: Constants.sizeCanvasHeight))
        whitePage()
    }
    
    // MARK: - 2 BeginView
    public func beginView() {
        self.backgroundColor = .white
        buttonBegin = UIButton(type: .system)
        buttonBegin.setTitle("New Game", for: .normal)
        buttonBegin.addTarget(self, action: #selector(askNewGame), for: .touchUpInside)
        buttonBegin.layer.cornerRadius = 5
        buttonBegin.layer.borderWidth = 1
        buttonBegin.layer.borderColor = UIColor.black.cgColor
        buttonBegin.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
        
        self.addSubview(buttonBegin)
        buttonBegin.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.layoutMarginsGuide
        NSLayoutConstraint.activate([
            buttonBegin.topAnchor.constraint(equalTo: margins.topAnchor, constant: 140),
            buttonBegin.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 300),
            buttonBegin.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    @objc public func askNewGame() {
        buttonBegin.removeFromSuperview()
        createPlayersView()
        initPlayers()
    }
    
    
    // MARK: - 3 Create Players's Name
    public func createPlayersView() {
        
        //Init elements
        self.backgroundColor = .white
        
        // UserName 1
        labelUserName11 = createLabel("UserName 1")
        self.addSubview(labelUserName11)
        
        textFieldUserName11 = createTextfield("UserName", 1100)
        textFieldUserName11.becomeFirstResponder()
        self.addSubview(textFieldUserName11)
        
        // UserName 1 - Person1
        labelPers11 = createLabel("person 1")
        self.addSubview(labelPers11)
        textFielPers11 = createTextfield("PersonName1", 1111)
        self.addSubview(textFielPers11)
        img11 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers11Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img11.image = UIImage(named:"q8.png")
        img11.tag = 111
        self.addSubview(img11)
        // UserName 1 - Person2
        labelPers12 = createLabel("person 2")
        labelPers12.textColor = .black
        self.addSubview(labelPers12)
        textFielPers12 = createTextfield("PersonName2", 1112)
        self.addSubview(textFielPers12)
        img12 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers12Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img12.image = UIImage(named:"q8.png")
        img12.tag = 112
        self.addSubview(img12)
        // UserName 1 - Person3
        labelPers13 = createLabel("person 3")
        labelPers13.textColor = .black
        self.addSubview(labelPers13)
        textFielPers13 = createTextfield("PersonName3", 1113)
        self.addSubview(textFielPers13)
        img13 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers13Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img13.image = UIImage(named:"q8.png")
        img13.tag = 113
        self.addSubview(img13)
        
        // UserName 2
        labelUserName21 = createLabel("UserName 2")
        self.addSubview(labelUserName21)
        textFieldUserName21 = createTextfield("UserName", 1120)
        self.addSubview(textFieldUserName21)
        // UserName 2 - Person1
        labelPers21 = createLabel("person 1")
        self.addSubview(labelPers21)
        textFielPers21 = createTextfield("PersonName1", 1121)
        self.addSubview(textFielPers21)
        img21 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers21Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img21.image = UIImage(named:"q8.png")
        img21.tag = 121
        self.addSubview(img21)
        // UserName 2 - Person2
        labelPers22 = createLabel("person 2")
        labelPers22.textColor = .black
        self.addSubview(labelPers22)
        textFielPers22 = createTextfield("PersonName2", 1122)
        self.addSubview(textFielPers22)
        img22 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers22Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img22.image = UIImage(named:"q8.png")
        img22.tag = 122
        self.addSubview(img22)
        // UserName 2 - Person3
        labelPers23 = createLabel("person 3")
        labelPers23.textColor = .black
        self.addSubview(labelPers23)
        textFielPers23 = createTextfield("PersonName3", 1123)
        self.addSubview(textFielPers23)
        img23 = UIImageView(frame: CGRect(x: Constants.imgFormPersX, y: Constants.imgFormPers23Y, width: Constants.imgWidthForm, height: Constants.imgHeightForm))
        img23.image = UIImage(named:"q8.png")
        img23.tag = 123
        self.addSubview(img23)
        
        // ButtonCancel
        buttonCancel = UIButton(type: .system)
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        buttonCancel.layer.cornerRadius = 5
        buttonCancel.layer.borderWidth = 1
        buttonCancel.layer.borderColor = UIColor.black.cgColor
        buttonCancel.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
        self.addSubview(buttonCancel)
        
        // ButtonPlay buttonPlay
        buttonPlay = UIButton(type: .system)
        buttonPlay.setTitle("Play", for: .normal)
        buttonPlay.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        buttonPlay.layer.cornerRadius = 5
        buttonPlay.layer.borderWidth = 1
        buttonPlay.layer.borderColor = UIColor.black.cgColor
        buttonPlay.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
        buttonPlay.isEnabled = false
        self.addSubview(buttonPlay)
        
        // Show characters
        showAllCharacters()
        
        // Layout player 1
        textFieldUserName11.translatesAutoresizingMaskIntoConstraints = false
        labelUserName11.translatesAutoresizingMaskIntoConstraints = false
        labelPers11.translatesAutoresizingMaskIntoConstraints = false
        textFielPers11.translatesAutoresizingMaskIntoConstraints = false
        labelPers12.translatesAutoresizingMaskIntoConstraints = false
        textFielPers12.translatesAutoresizingMaskIntoConstraints = false
        labelPers13.translatesAutoresizingMaskIntoConstraints = false
        textFielPers13.translatesAutoresizingMaskIntoConstraints = false
        // Layout player 2
        textFieldUserName21.translatesAutoresizingMaskIntoConstraints = false
        labelUserName21.translatesAutoresizingMaskIntoConstraints = false
        labelPers21.translatesAutoresizingMaskIntoConstraints = false
        textFielPers21.translatesAutoresizingMaskIntoConstraints = false
        labelPers22.translatesAutoresizingMaskIntoConstraints = false
        textFielPers22.translatesAutoresizingMaskIntoConstraints = false
        labelPers23.translatesAutoresizingMaskIntoConstraints = false
        textFielPers23.translatesAutoresizingMaskIntoConstraints = false
        // Layout button
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.layoutMarginsGuide
        NSLayoutConstraint.activate([
            // Layout UserName 11
            labelUserName11.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100),
            labelUserName11.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 130),
            textFieldUserName11.topAnchor.constraint(equalTo: labelUserName11.topAnchor, constant: -7),
            textFieldUserName11.leftAnchor.constraint(equalTo: labelUserName11.leftAnchor, constant: 200),
            textFieldUserName11.rightAnchor.constraint(equalTo: labelUserName11.leftAnchor, constant: 500),
            // Layout Person11
            labelPers11.topAnchor.constraint(equalTo: labelUserName11.bottomAnchor, constant: 40),
            labelPers11.leftAnchor.constraint(equalTo: labelUserName11.leftAnchor, constant: 50),
            textFielPers11.topAnchor.constraint(equalTo: labelPers11.topAnchor, constant: -7),
            textFielPers11.leftAnchor.constraint(equalTo: labelPers11.leftAnchor, constant: 200),
            textFielPers11.rightAnchor.constraint(equalTo: labelPers11.leftAnchor, constant: 450),
            // Layout Person12
            labelPers12.topAnchor.constraint(equalTo: labelPers11.bottomAnchor, constant: 40),
            labelPers12.leftAnchor.constraint(equalTo: labelPers11.leftAnchor, constant: 0),
            textFielPers12.topAnchor.constraint(equalTo: labelPers12.topAnchor, constant: -7),
            textFielPers12.leftAnchor.constraint(equalTo: labelPers12.leftAnchor, constant: 200),
            textFielPers12.rightAnchor.constraint(equalTo: labelPers12.leftAnchor, constant: 450),
            // Layout Person13
            labelPers13.topAnchor.constraint(equalTo: labelPers12.bottomAnchor, constant: 40),
            labelPers13.leftAnchor.constraint(equalTo: labelPers12.leftAnchor, constant: 0),
            textFielPers13.topAnchor.constraint(equalTo: labelPers13.topAnchor, constant: -7),
            textFielPers13.leftAnchor.constraint(equalTo: labelPers13.leftAnchor, constant: 200),
            textFielPers13.rightAnchor.constraint(equalTo: labelPers13.leftAnchor, constant: 450),
            // Layout UserName 2
            labelUserName21.topAnchor.constraint(equalTo: labelPers13.bottomAnchor, constant: 80),
            labelUserName21.leftAnchor.constraint(equalTo: labelPers13.leftAnchor, constant: -50),
            textFieldUserName21.topAnchor.constraint(equalTo: labelUserName21.topAnchor, constant: -7),
            textFieldUserName21.leftAnchor.constraint(equalTo: labelUserName21.leftAnchor, constant: 200),
            textFieldUserName21.rightAnchor.constraint(equalTo: labelUserName21.leftAnchor, constant: 500),
            // Layout Person21
            labelPers21.topAnchor.constraint(equalTo: labelUserName21.bottomAnchor, constant: 40),
            labelPers21.leftAnchor.constraint(equalTo: labelUserName21.leftAnchor, constant: 50),
            textFielPers21.topAnchor.constraint(equalTo: labelPers21.topAnchor, constant: -7),
            textFielPers21.leftAnchor.constraint(equalTo: labelPers21.leftAnchor, constant: 200),
            textFielPers21.rightAnchor.constraint(equalTo: labelPers21.leftAnchor, constant: 450),
            // Layout Person22
            labelPers22.topAnchor.constraint(equalTo: labelPers21.bottomAnchor, constant: 40),
            labelPers22.leftAnchor.constraint(equalTo: labelPers21.leftAnchor, constant: 0),
            textFielPers22.topAnchor.constraint(equalTo: labelPers22.topAnchor, constant: -7),
            textFielPers22.leftAnchor.constraint(equalTo: labelPers22.leftAnchor, constant: 200),
            textFielPers22.rightAnchor.constraint(equalTo: labelPers22.leftAnchor, constant: 450),
            // Layout Person23
            labelPers23.topAnchor.constraint(equalTo: labelPers22.bottomAnchor, constant: 40),
            labelPers23.leftAnchor.constraint(equalTo: labelPers22.leftAnchor, constant: 0),
            textFielPers23.topAnchor.constraint(equalTo: labelPers23.topAnchor, constant: -7),
            textFielPers23.leftAnchor.constraint(equalTo: labelPers23.leftAnchor, constant: 200),
            textFielPers23.rightAnchor.constraint(equalTo: labelPers23.leftAnchor, constant: 450),
            // ButtonCancel
            buttonCancel.topAnchor.constraint(equalTo: labelPers23.bottomAnchor, constant: 60),
            buttonCancel.leftAnchor.constraint(equalTo: labelPers23.leftAnchor, constant: -50),
            buttonCancel.rightAnchor.constraint(equalTo: labelPers23.leftAnchor, constant: 190),
            // ButtonPlay
            buttonPlay.topAnchor.constraint(equalTo: buttonCancel.topAnchor, constant: 0),
            buttonPlay.leftAnchor.constraint(equalTo: buttonCancel.rightAnchor, constant: 20),
            buttonPlay.rightAnchor.constraint(equalTo: buttonCancel.rightAnchor, constant: 260),
            
        ])
    }
    
    private func showAllCharacters(){
        for (index,item) in Constants.imgPers.enumerated() {
            let character = UIImageView(frame: CGRect(x: 150 + (60 * index), y: 20, width: 50, height: 50))
            character.image = UIImage(named:item)
            character.isUserInteractionEnabled = true
            character.tag = 1001 + index
            self.addSubview(character)
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(recognizer:)))
            character.addGestureRecognizer(pan)
        }
    }
    
    private func initPlayers(){
        
        personsOfPlayer1.removeAll()
        personsOfPlayer2.removeAll()
        
        for index in 1...Constants.numberOfPersonsByPlayer {
            let person1 = Person(health: Constants.maxHealth, id: 10 + index, name: "", nickname: "", characterId: 0, weapon: giveRandomNewWeapon(), posXWaiting: Constants.player1PosX, posYWaiting: Constants.posYPerson1  + Constants.offsetPosYForEachPerson * CGFloat(index-1))
            person1.delegate = self
            personsOfPlayer1.append(person1)
            
            let person2 = Person(health: Constants.maxHealth, id: 20 + index, name: "", nickname: "", characterId: 0, weapon: giveRandomNewWeapon(), posXWaiting: Constants.player2PosX, posYWaiting: Constants.posYPerson1  + Constants.offsetPosYForEachPerson * CGFloat(index-1))
            person2.delegate = self
            personsOfPlayer2.append(person2)
        }
    }
    
    private func giveRandomNewWeapon() -> WeaponsFamily {
        let rand = Int.random(in: 0..<Constants.weaponsList.count)
        switch Constants.weaponsList[rand] {
        case "knife":
            return Knife()
        case "hash":
            return Hash()
        case "gun":
            return Gun()
        case "submachine":
            return Submachine()
        case "sword":
            return Sword()
        case "dagger":
            return Dagger()
        default:
            print("ERROR : giveRandomNewWeapon()")
        }
        return Knife()
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self)
        
        if (recognizer.state == UIGestureRecognizer.State.began) {
            testIfImgTagIsAttributedToAPerson(recognizer.view!.tag)
        }
        if (recognizer.state == UIGestureRecognizer.State.ended) {
            let resX = aproximateAccuracyX(Int(recognizer.view!.frame.origin.x))
            if resX {
                let resY = aproximateAccuracyYAndWitchImgPers(Int(recognizer.view!.frame.origin.y))
                if let img = resY {
                    imgPersAssociateWithPlayer(img, recognizer)
                } else {
                    returnOfImgPersWaiting(recognizer.view!)
                }
            } else {
                returnOfImgPersWaiting(recognizer.view!)
            }
        }
    }
    
    private func testIfImgTagIsAttributedToAPerson(_ tagImgCharacter: Int){
        // Update, if we move img.character of person.character.id
        personsOfPlayer1.forEach { person in if (person.characterId) == tagImgCharacter {
            person.characterId = 0 } }
        
        personsOfPlayer2.forEach { person in if (person.characterId) == tagImgCharacter {
            person.characterId = 0 } }
        
        verifyIfAllFieldIsGiven()
    }
    
    private func returnCharacterToWaitWithTag(_ imgCharacterTagId: Int){
        self.subviews.enumerated().forEach( {
            if $0.1.tag == imgCharacterTagId {
                returnOfImgPersWaiting($0.1)
            }
        } )
    }
    
    private func imgPersAssociateWithPlayer(_ img: UIImageView, _ recognizer: UIPanGestureRecognizer){
        
        let imgId = img.tag - 100
        
        personsOfPlayer1.forEach { person in 
            if imgId == person.id {
                if person.characterId != 0 { returnCharacterToWaitWithTag(person.characterId!) 
                }
                person.characterId = recognizer.view!.tag
                UIView.animate(withDuration: 0.1) {
                    let offsetInYToImg = person.id - 10
                    recognizer.view?.center = CGPoint(x: Constants.imgFormPersX + 25, y: Constants.imgFormPers1y + offsetInYToImg * 60 + 25 )
                }
            }            
        }
        
        personsOfPlayer2.forEach { person in 
            if imgId == person.id {
                if person.characterId != 0 { returnCharacterToWaitWithTag(person.characterId!) 
                }
                person.characterId = recognizer.view!.tag
                UIView.animate(withDuration: 0.1) {
                    let offsetInYToImg = person.id - 20
                    recognizer.view?.center = CGPoint(x: Constants.imgFormPersX + 25, y: Constants.imgFormPers2y + offsetInYToImg * 60 + 5 )
                }
            }            
        }

        verifyIfAllFieldIsGiven()
    }
    
    private func returnOfImgPersWaiting(_ view: UIView){
        switch view.tag {
        case 1001:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 175, y: 45 )}
        case 1002:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 235, y: 45 )}
        case 1003:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 295, y: 45 )}
        case 1004:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 355, y: 45 )}
        case 1005:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 415, y: 45 )}
        case 1006:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 475, y: 45 )}
        case 1007:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 535, y: 45 )}
        case 1008:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 595, y: 45 )}
        case 1009:
            UIView.animate(withDuration: 0.4) {view.center = CGPoint(x: 655, y: 45 )}
        default:
            print("ERROR : returnOfImgPersWaiting()")
        }
        
    }
    
    private func aproximateAccuracyYAndWitchImgPers( _ posY: Int) -> UIImageView? {
        // If before Player1
        if posY + Constants.marginY - Constants.imgFormPers11Y < 0 {
            return nil
        }
        // If after Player1
        if posY - Constants.marginY - Constants.imgFormPers13Y > 0 {
            if posY + Constants.marginY - Constants.imgFormPers21Y < 0 {
                return nil
            }
            // It's Player 2
            if posY - Constants.marginY - Constants.imgFormPers23Y < 0 {
                let step = (Constants.imgFormPers23Y - Constants.imgFormPers21Y + 2 * Constants.marginY) / 3
                let originComptuted = Constants.imgFormPers21Y - Constants.marginY
                if posY < originComptuted + step {
                    // img21 is correct
                    return img21
                } else {
                    if posY < originComptuted + (2 * step) {
                        // img22 is correct
                        return img22
                    } else {
                        // img23 is correct
                        return img23
                    } 
                }
            }
            return nil
        }
        // It's Player 1
        let step = (Constants.imgFormPers13Y - Constants.imgFormPers11Y + 2 * Constants.marginY) / 3
        let originComptuted = Constants.imgFormPers11Y - Constants.marginY
        if posY < originComptuted + step {
            // img11 is correct
            return img11
        } else {
            if posY < originComptuted + (2 * step) {
                // img12 is correct
                return img12
            } else {
                // img13 is correct
                return img13
            } 
        }
    }
    
    private func aproximateAccuracyX( _ posX: Int) -> Bool{
        // If before (x axis)
        if posX + Constants.marginX - Constants.imgFormPersX < 0 {
            return false
        }
        // If after (x axis)
        if posX - Constants.marginX - Constants.imgFormPersX > 0 {
            return false
        }
        // Good it's in the middle (x axis)
        return true
    }
    
    private func setImgCharacter(_ uiimg: UIImageView){
        uiimg.image = UIImage(named:Constants.nameImgQuestionMark)
    }
    
    @objc private func cancelAction() {
        
        // ACTIVATED ONLY for tests
        autoInit()
        
        createPlayers()
        removeAllElements()
        isGameOver = false
        beginPlay()
// DEACTIVATED : ONLY for tests        
//        removeAllElements()
//        isGameOver = false
//        beginView()
    }
    
    private func autoInit(){
        textFieldUserName11.text! = "Player1"
        textFieldUserName21.text! = "Player2"
        textFielPers11.text! = "person11"
        textFielPers12.text! = "person12"
        textFielPers13.text! = "person13"
        textFielPers21.text! = "person21"
        textFielPers22.text! = "person22"
        textFielPers23.text! = "person23"
        personsOfPlayer1[0].characterId! = 1004
        personsOfPlayer1[1].characterId! = 1005
        personsOfPlayer1[2].characterId! = 1009
        personsOfPlayer2[0].characterId! = 1007
        personsOfPlayer2[1].characterId! = 1002
        personsOfPlayer2[2].characterId! = 1003
    }   
    
    @objc private func playAction() {
        createPlayers()
        //Erase screen
        removeAllElements()
        isGameOver = false
        // Draw
        beginPlay()
    }

    
    private func createPlayers() {
        // Player 1
        let listTextFieldPersonNamePlayer1 = [textFielPers11, textFielPers12, textFielPers13]
        listTextFieldPersonNamePlayer1.forEach { textField in 
            personsOfPlayer1.forEach { person in 
                if ((textField!.tag - 1100) == person.id) {
                    person.nickname = textField!.text
                    person.name = textFieldUserName11!.text
                    person.health = Constants.maxHealth
                }
            }
        }
        
        // Player 2
        let listTextFieldPersonNamePlayer2 = [textFielPers21, textFielPers22, textFielPers23]
        listTextFieldPersonNamePlayer2.forEach { textField in 
            personsOfPlayer2.forEach { person in 
                if ((textField!.tag - 1100) == person.id) {
                    person.nickname = textField!.text
                    person.name = textFieldUserName21!.text
                    person.health = Constants.maxHealth
                }
            }
        }
    }
    
    private func createLabel(_ name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textColor = .black
        return label
    }
    
    private func createTextfield(_ placeholder: String, _ idTag: Int) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.textColor = .black
        textField.tag = idTag
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(controlTextfield(_:)), for: .editingChanged)
        return textField
    }
    
    fileprivate func verifyIfAllFieldIsGiven() {
        let listTextfield = [textFieldUserName11, textFieldUserName21, textFielPers11, textFielPers12, textFielPers13, textFielPers21, textFielPers22, textFielPers23]
        var listCompare: [String] = []
        var nbEmptyTextfield = 0
        var duplicateTextfield = false
        for object in listTextfield {
            if let tf = object {
                if tf.text != "" {
                    if listCompare.contains(tf.text!) {
                        tf.backgroundColor = .red
                        duplicateTextfield = true
                    } else {
                        listCompare.append(tf.text!)
                        tf.backgroundColor = .white
                    }
                } else {
                    tf.backgroundColor = .white
                    nbEmptyTextfield += 1
                }
            }
        }
        if nbEmptyTextfield == 0 && duplicateTextfield == false {
            if verifyIfAllCharactersIsGiven() {
                buttonPlay.isEnabled = true
            } else {
                buttonPlay.isEnabled = false
            }
        } else {
            buttonPlay.isEnabled = false
        }
    }
    
    @objc private func controlTextfield(_ textField: UITextField) {
        verifyIfAllFieldIsGiven()
    }
    
    private func verifyIfAllCharactersIsGiven() -> Bool {
        var test = true
        personsOfPlayer1.forEach({ if $0.characterId! < 1000 {test = false}})
        personsOfPlayer2.forEach({ if $0.characterId! < 1000 {test = false}})
        return test
    }
    
    private func removeAllElements() {
        self.subviews.enumerated().forEach( {
            $0.1.removeFromSuperview()
        })
    }
    
    // MARK: - 4 BeginPlay
    
    private func showIdPerImg(_ idImgCharact: Int) -> String {
        return Constants.nameImgPerson + String (idImgCharact - 1000) + Constants.nameImgPersonExtention
    }
    
    private func beginPlay() {

        backgroundImageView = UIImageView(image: UIImage(named: Constants.nameImgBackground))
        backgroundImageView.frame = self.frame
        addSubview(backgroundImageView)
        fightIsRunning = false
        
        // Initialize person : icon's button
        
        allButtonPersons = []
        for person in personsOfPlayer1 {
            let button = person.createButtonForPers(person: person, imgName: self.showIdPerImg(person.characterId!), UIButton(type: .custom))
            self.addSubview(button)
            self.allButtonPersons.append(button)
        }
        for person in personsOfPlayer2 {
            let button = person.createButtonForPers(person: person, imgName: self.showIdPerImg(person.characterId!), UIButton(type: .custom))
            self.addSubview(button)
            self.allButtonPersons.append(button)
        }
                
        // Initialize fight button
        buttonfight = createButtonFight()
        addSubview(buttonfight)
        addRectForScore()
        addScores()
        nbOfFight = 0
    }
    
    private func addRectForScore(){
        let rectFrame: CGRect = CGRect(x:CGFloat(0), y:CGFloat(700), width:CGFloat(1000), height:CGFloat(300))
        greenView = UIView(frame: rectFrame)
        greenView.backgroundColor = UIColor.lightGray
        self.addSubview(greenView)
    }
    
    private func addScores(){
        labelForUser1 = createLabel(personsOfPlayer1[0].name + Constants.strOneHundredPercent)
        labelForPers11 = createLabel(personsOfPlayer1[0].nickname + Constants.strTwoPoints + String (personsOfPlayer1[0].health))
        labelForPers12 = createLabel(personsOfPlayer1[1].nickname + Constants.strTwoPoints + String (personsOfPlayer1[1].health))
        labelForPers13 = createLabel(personsOfPlayer1[2].nickname + Constants.strTwoPoints + String (personsOfPlayer1[2].health))
        labelForUser2 = createLabel(personsOfPlayer2[0].name + Constants.strOneHundredPercent)
        labelForPers21 = createLabel(personsOfPlayer2[0].nickname + Constants.strTwoPoints + String (personsOfPlayer2[0].health))
        labelForPers22 = createLabel(personsOfPlayer2[1].nickname + Constants.strTwoPoints + String (personsOfPlayer2[1].health))
        labelForPers23 = createLabel(personsOfPlayer2[2].nickname + Constants.strTwoPoints + String (personsOfPlayer2[2].health))
        self.addSubview(labelForUser1)
        self.addSubview(labelForPers11)
        self.addSubview(labelForPers12)
        self.addSubview(labelForPers13)
        self.addSubview(labelForUser2)
        self.addSubview(labelForPers21)
        self.addSubview(labelForPers22)
        self.addSubview(labelForPers23)
        labelForUser1.translatesAutoresizingMaskIntoConstraints = false
        labelForPers11.translatesAutoresizingMaskIntoConstraints = false
        labelForPers12.translatesAutoresizingMaskIntoConstraints = false
        labelForPers13.translatesAutoresizingMaskIntoConstraints = false
        labelForUser2.translatesAutoresizingMaskIntoConstraints = false
        labelForPers21.translatesAutoresizingMaskIntoConstraints = false
        labelForPers22.translatesAutoresizingMaskIntoConstraints = false
        labelForPers23.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = self.layoutMarginsGuide
        NSLayoutConstraint.activate([
            labelForUser1.topAnchor.constraint(equalTo: margin.topAnchor, constant: 700),
            labelForUser1.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: 20),
            labelForUser1.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: 300),
            
            labelForPers11.topAnchor.constraint(equalTo: labelForUser1.topAnchor, constant: 50),
            labelForPers11.leftAnchor.constraint(equalTo: labelForUser1.leftAnchor, constant: 20),
            labelForPers11.rightAnchor.constraint(equalTo: labelForUser1.rightAnchor, constant: 0),
            
            labelForPers12.topAnchor.constraint(equalTo: labelForUser1.topAnchor, constant: 100),
            labelForPers12.leftAnchor.constraint(equalTo: labelForUser1.leftAnchor, constant: 20),
            labelForPers12.rightAnchor.constraint(equalTo: labelForUser1.rightAnchor, constant: 0),
            
            labelForPers13.topAnchor.constraint(equalTo: labelForUser1.topAnchor, constant: 150),
            labelForPers13.leftAnchor.constraint(equalTo: labelForUser1.leftAnchor, constant: 20),
            labelForPers13.rightAnchor.constraint(equalTo: labelForUser1.rightAnchor, constant: 0),
            
            labelForUser2.topAnchor.constraint(equalTo: labelForUser1.topAnchor, constant: 0),
            labelForUser2.leftAnchor.constraint(equalTo: labelForUser1.leftAnchor, constant: 400),
            labelForUser2.rightAnchor.constraint(equalTo: labelForUser1.rightAnchor, constant: 400),
            
            labelForPers21.topAnchor.constraint(equalTo: labelForUser2.topAnchor, constant: 50),
            labelForPers21.leftAnchor.constraint(equalTo: labelForUser2.leftAnchor, constant: 20),
            labelForPers21.rightAnchor.constraint(equalTo: labelForUser2.rightAnchor, constant: 0),
            
            labelForPers22.topAnchor.constraint(equalTo: labelForUser2.topAnchor, constant: 100),
            labelForPers22.leftAnchor.constraint(equalTo: labelForUser2.leftAnchor, constant: 20),
            labelForPers22.rightAnchor.constraint(equalTo: labelForUser2.rightAnchor, constant: 0),
            
            labelForPers23.topAnchor.constraint(equalTo: labelForUser2.topAnchor, constant: 150),
            labelForPers23.leftAnchor.constraint(equalTo: labelForUser2.leftAnchor, constant: 20),
            labelForPers23.rightAnchor.constraint(equalTo: labelForUser2.rightAnchor, constant: 0),
        ])
    }
    
    private func createButtonFight() -> UIButton {
        buttonfight = UIButton(type: .system)
        buttonfight.frame = CGRect(x: 300, y: 410, width: 180, height: 30)
        buttonfight.setTitle(Constants.msgReadyToFight, for: .normal)
        buttonfight.addTarget(self, action: #selector(actionFight), for: .touchUpInside)
        buttonfight.layer.cornerRadius = 5
        buttonfight.layer.borderWidth = 1
        buttonfight.layer.borderColor = UIColor.black.cgColor
        buttonfight.backgroundColor = UIColor.white
        buttonfight.alpha = 0.7
        buttonfight.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
        buttonfight.isEnabled = false
        return buttonfight
    }
    
    private func removeScores(){
        labelForUser1.removeFromSuperview()
        labelForPers11.removeFromSuperview()
        labelForPers12.removeFromSuperview()
        labelForPers13.removeFromSuperview()
        labelForUser2.removeFromSuperview()
        labelForPers21.removeFromSuperview()
        labelForPers22.removeFromSuperview()
        labelForPers23.removeFromSuperview()
    }
    
    // MARK: - 5 Moves
    
    
    internal func personWasTapped(person: Person) {
        if fightIsRunning || isGameOver { return }
        if person.status == .waiting && nobodyElseIsGoingToFight(person) {
            otherPersonMustWaiting(person)
            goToFightPosition(person)
        } else if person.status == .fighting {
            goToWaitPosition(person)
        }
    }
    
    private func nobodyElseIsGoingToFight(_ person: Person) -> Bool {
        var test = true
        if person.id < 20 {
            self.personsOfPlayer1.forEach { person in
                if person.status == .goToFight { 
                    test = false
                }
            }
        } else {
            self.personsOfPlayer2.forEach { person in
                if person.status == .goToFight { 
                    test = false
                }
            }
        }
        return test
    }
    
    private func otherPersonMustWaiting(_ person: Person){
        // Go to wait for each person of current player
        if person.id < 20 {
            self.personsOfPlayer1.forEach { person in
                if person.status == .fighting { goToWaitPosition(person) 
                }
            }
        } else {
            self.personsOfPlayer2.forEach { person in
                if person.status == .fighting { goToWaitPosition(person) }
            }
        }
    }
    
    private func goToFightPosition(_ person: Person){
        person.status = .goToFight
        if person.id < 20 {
            movePerson(person: person, toX: Constants.player1PosXToFight - person.posXWaiting, toY: Constants.player1PosYToFight - person.posYWaiting)
        } else {
            movePerson(person: person, toX: Constants.player2PosXToFight - person.posXWaiting, toY: Constants.player2PosYToFight - person.posYWaiting)
        }
    }
    
    private func goToWaitPosition(_ person: Person){
        buttonfight.isEnabled = false
        person.status = .goToWaiting
        if person.id < 20 {
            movePerson(person: person, toX: person.posXWaiting - Constants.player1PosXToFight, toY: person.posYWaiting - Constants.player1PosYToFight)
        } else {
            movePerson(person: person, toX: person.posXWaiting - Constants.player2PosXToFight, toY: person.posYWaiting - Constants.player2PosYToFight)
        }
    }
    
    private func movePerson(person: Person, toX: CGFloat, toY: CGFloat) {
        UIView.animate(withDuration: 1.0, animations: {
            person.button.center.x += toX
            person.button.center.y += toY
        }) { [self](finished) in
            if finished {
                if person.status == .goToFight {
                    person.status = .fighting
                    
                } else if person.status == .goToWaiting {
                    person.status = .waiting
                    
                }
                self.playersAreReady()
            }
        }
    }
    
    private func playersAreReady() {
        var test = 0
        // if only one person of player1 is in fight position -> test = 1
        personsOfPlayer1.forEach { 
            person in
            if person.status == .fighting {
                test += 1
                personPlayer1Fighting = person.id - 11
            }
        }
        
        // if only one person of player2 is in fight position -> test += 10
        personsOfPlayer2.forEach { 
            person in
            if person.status == .fighting {
                test += 10
                personPlayer2Fighting = person.id - 21
            }
        }
        
        if test == 11 { // If there's only one player1 and one player2
            fightLevel = 1
            buttonfight.isEnabled = true
        } else {
            fightLevel = 0
            buttonfight.isEnabled = false
        }
    }

    @objc private func actionFight(){
        fightIsRunning = true
        switch fightLevel {
        case 1:
            nbOfFight += 1
            beginFightOf(playerNb: 1, person: personsOfPlayer1[personPlayer1Fighting])
        case 2:
            removeOneElementfromSuperview(tagToErase: (99))
            fightLevel += 1
            actionFight()
        case 3:
            givingAShot(leftToRight: true, complete: { [self] in 
                if personsOfPlayer2[personPlayer2Fighting].receivesAHit(giver: personsOfPlayer1[personPlayer1Fighting]) == 0 {
                    // P2 is dead
                    redCrossOnPerson(personId: self.personsOfPlayer2[personPlayer2Fighting].id)
                    finishFight()
                } else {
                    // P2 is hurt
                    fightLevel += 1
                    actionFight()
                }
                endOfFight(personWhoReceiveHit: self.personsOfPlayer2[personPlayer2Fighting])
                updateHealthUsers()
            })
        case 4:
            beginFightOf(playerNb: 2, person: personsOfPlayer2[personPlayer2Fighting])
        case 5:
            removeOneElementfromSuperview(tagToErase: (99))
            fightLevel += 1
            actionFight()
        case 6:
            givingAShot(leftToRight: false, complete: { [self] in 
                if personsOfPlayer1[personPlayer1Fighting].receivesAHit(giver: self.personsOfPlayer2[personPlayer2Fighting]) == 0 {
                    // P1 is dead
                    redCrossOnPerson(personId: personsOfPlayer1[personPlayer1Fighting].id)
                } else {
                    // P1 is hurt
                    fightLevel += 1
                    actionFight()
                }
                endOfFight(personWhoReceiveHit: personsOfPlayer1[personPlayer1Fighting])
                updateHealthUsers()
                finishFight()
            })            
        default:
            break
        }
    }
    
    private func finishFight(){
        fightIsRunning = false
        goToWaitPosition(personsOfPlayer1[personPlayer1Fighting])
        goToWaitPosition(personsOfPlayer2[personPlayer2Fighting])
    }
    
    private func givingAShot(leftToRight: Bool, complete: @escaping () -> ()){
        
        buttonfight.isEnabled = false
        let kick = UIImageView(image: UIImage(named: Constants.nameImgKick))
        var origin = CGPoint()
        var offset: CGFloat = 0
        if leftToRight {
            origin = CGPoint(x: Constants.player1PosXToFight + 30, y: Constants.player1PosYToFight + 30)
            offset = 50
        } else {
            origin = CGPoint(x: Constants.player2PosXToFight - 10, y: Constants.player1PosYToFight + 30)
            kick.transform = kick.transform.scaledBy(x: -1.0, y: 1.0)
            offset = -50
        }
        kick.frame = CGRect(origin: origin, size: kick.frame.size)
        self.addSubview(kick)
        
        UIView.animate(withDuration: Constants.delayToKick, animations: {
            kick.center.x += offset
        }) { [self] finished in
            if finished {
                kick.removeFromSuperview()
                self.givingAShotIsRunning = false
                complete()
            }
        }
    }
    
    private func beginFightOf(playerNb: Int, person: Person){
        let rd = Int.random(in: 1...10)
        if rd >= Constants.randToShowTrunc {
            buttonTrunk = person.addTrunkForPlayer(playerNb, person, giveRandomNewWeapon(), UIButton(type: .custom))
            self.addSubview(buttonTrunk)
            buttonfight.setTitle(Constants.msgContinue, for: .normal)
            buttonfight.isEnabled = true
            fightLevel += 1
        } else {
            fightLevel += 2
            actionFight()
        }
    }
    
    
    func trunkWasTapped(idButton: Int) {
        removeOneElementfromSuperview(tagToErase: idButton)
        fightLevel += 1
        actionFight()
    }
    
    private func removeOneElementfromSuperview(tagToErase tagId: Int){
        self.subviews.forEach { element in 
            if element.tag == tagId  {element.removeFromSuperview()} }
    }
    
    private func redCrossOnPerson(personId: Int){
        allButtonPersons.forEach { btn in
            if btn.tag == personId {
                btn.setImage(UIImage(named: Constants.nameImgRedcross)!, for: .normal)
                btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }

    private func endOfFight(personWhoReceiveHit: Person) {
        switch personWhoReceiveHit.id {
        case 11:
            labelForPers11.text = personsOfPlayer1[0].nickname + " : " + String (personsOfPlayer1[0].health)
        case 12:
            labelForPers12.text = personsOfPlayer1[1].nickname + " : " + String (personsOfPlayer1[1].health)
        case 13:
            labelForPers13.text = personsOfPlayer1[2].nickname + " : " + String (personsOfPlayer1[2].health)
        case 21:
            labelForPers21.text = personsOfPlayer2[0].nickname + " : " + String (personsOfPlayer2[0].health)
        case 22:
            labelForPers22.text = personsOfPlayer2[1].nickname + " : " + String (personsOfPlayer2[1].health)
        case 23:
            labelForPers23.text = personsOfPlayer2[2].nickname + " : " + String (personsOfPlayer2[2].health)
        default:
            print("ERROR : endOfFight 1")
        }

        switch witchPlayerIsDead(){
        case 0:
            buttonfight.setTitle(Constants.msgReadyToFight, for: .normal)
        case 1:
            gameOver(playerDead: 1)
        case 2:
            gameOver(playerDead: 2)
        default:
            print("ERROR : endOfFight 2")
        }
    }
    
    private func gameOver(playerDead: Int){
        let nbPersAlive = countPersonStayAlive4Winner(playerDead)
        isGameOver = true
        
        // Erase buttonFight
        buttonfight.removeFromSuperview()
        
        // buttonGameover
        buttonGameover = UIButton(type: .system)
        buttonGameover.frame = CGRect(x: 300, y: 400, width: 180, height: 30)
        buttonGameover.setTitle(Constants.msgGameOver, for: .normal)
        buttonGameover.addTarget(self, action: #selector(finishGame), for: .touchUpInside)
        buttonGameover.layer.cornerRadius = 5
        buttonGameover.layer.borderWidth = 1
        buttonGameover.layer.borderColor = UIColor.black.cgColor
        buttonGameover.backgroundColor = UIColor.white
        buttonGameover.alpha = 0.7
        buttonGameover.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
        buttonGameover.isEnabled = true
        self.addSubview(buttonGameover)
        
        // labelGameover
        let msg = (playerDead == 1 ? personsOfPlayer2[0].name! : personsOfPlayer1[0].name!) + Constants.strWinIn + String(nbOfFight!) + Constants.strRoundAnd + String (nbPersAlive) + (nbPersAlive == 1 ? Constants.strPersonIsAlive : Constants.strPersonsAreAlive)
        labelGameover = UILabel()
        labelGameover.frame = CGRect(x: 270, y: 500, width: 380, height: 150)
        labelGameover.font = UIFont.systemFont(ofSize: 25.0)
        labelGameover.font = UIFont.boldSystemFont(ofSize: 25.0)
        labelGameover.text = msg
        labelGameover.numberOfLines = 0
        labelGameover.textColor = .black
        self.addSubview(labelGameover)
    }
    
    @objc private func finishGame(){
        
        removeScores()
        allButtonPersons.forEach { btn in btn.removeFromSuperview() }
        greenView.removeFromSuperview()
        buttonGameover.removeFromSuperview()
        labelGameover.removeFromSuperview()
        backgroundImageView.removeFromSuperview()
        
        whitePage()
        beginView()
    }

    private func countPersonStayAlive4Winner(_ playerDead: Int) -> Int {
        var nbAlive = 0
        if playerDead == 1 {
            personsOfPlayer2.forEach { person in if person.health != 0 { nbAlive += 1} }
        } else {
            personsOfPlayer1.forEach { person in if person.health != 0 { nbAlive += 1} }
        }
        return nbAlive
    }
    
    private func witchPlayerIsDead() -> Int{
        if personsOfPlayer1.reduce(0, { $0 + $1.health }) == 0 { return 1 } // Player1 is dead
        if personsOfPlayer2.reduce(0, { $0 + $1.health }) == 0 { return 2 } // Player2 is dead
        return 0 // Nobody is dead
    }
    
    private func updateHealthUsers() {
        // Update labelForUser1
        let health1 = personsOfPlayer1.reduce(0, { $0 + $1.health })
        labelForUser1.text = personsOfPlayer1[0].name! + Constants.strTwoPoints + String (Int (health1 * 100 / Constants.maxHealth / 3 )) + Constants.strPourcent
        
        // Update labelForUser2
        let health2 = personsOfPlayer2.reduce(0, { $0 + $1.health })
        labelForUser2.text = personsOfPlayer2[0].name + Constants.strTwoPoints + String (Int (health2 * 100 / Constants.maxHealth / 3 )) + Constants.strPourcent
    }
    
    public func whitePage() {
        self.backgroundColor = .white
    }
}

// MARK: - Person & Player
class Person: Player {
    var delegate: PersonDelegate?
    
    var nickname: String!
    var health: Int!
    var weapon: WeaponsFamily!
    var characterId: Int!
    var posXWaiting: CGFloat = 0
    var posYWaiting: CGFloat = 0
    var button: UIButton!
    var weaponInTrunk: WeaponsFamily!
    var status: Status!
    
    init(health: Int, id: Int, name: String, nickname: String, characterId: Int, weapon: WeaponsFamily, posXWaiting: CGFloat, posYWaiting: CGFloat) {
        self.health = health
        self.weapon = weapon
        self.nickname = nickname
        self.characterId = 0
        self.status = .waiting
        self.posXWaiting = posXWaiting
        self.posYWaiting = posYWaiting
        super.init(id: id, name: name)
    }
    
    @objc public func personIsTap(_ sender: UIButton){
        if health != 0 { 
            delegate?.personWasTapped(person: self)
        }
    }
    
    @objc public func takeNewWeapon(_ sender: UIButton!){
        weapon.name = weaponInTrunk.name
        weapon.value = weaponInTrunk.value
        button.setImage(UIImage(named: weaponInTrunk.name!), for: .normal)
        delegate?.trunkWasTapped(idButton: sender.tag)
    }
    
    public func receivesAHit(giver personGiver: Person) -> Int {
        health -= personGiver.weapon.value
        health = max(0, health)
        return health
    }
    
    public func createButtonForPers(person: Person, imgName: String, _ btn: UIButton) -> UIButton {
        btn.frame = CGRect(x: person.posXWaiting, y: person.posYWaiting, width: Constants.imgWidth, height: Constants.imgHeight)
        btn.setBackgroundImage(UIImage(named: imgName), for: UIControl.State.normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 30, left: -90, bottom: -70, right: -20)
        btn.setTitle(person.nickname, for: .normal)
        btn.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), for: .normal)
        btn.setImage(UIImage(named: person.weapon.name), for: .normal)
        if person.id < 20 {
            btn.imageEdgeInsets = UIEdgeInsets(top: 50, left: 30, bottom: 0, right: -10)
        } else {
            btn.imageEdgeInsets = UIEdgeInsets(top: 50, left: -10, bottom: 0, right: 30)
            btn.imageView!.transform = btn.imageView!.transform.scaledBy(x: -1.0, y: 1.0)
        }
        btn.tag = person.id
        btn.addTarget(self, action: #selector(personIsTap(_:)), for: .touchUpInside)
        button = btn
        return btn
    }
    
    public func addTrunkForPlayer(_ player: Int, _ person: Person, _ weapon: WeaponsFamily, _ buttonTrunk: UIButton) -> UIButton {        
        buttonTrunk.setBackgroundImage(UIImage(named: Constants.nameImgTrunk), for: UIControl.State.normal)
        buttonTrunk.setTitle(Constants.msgTakeThisWeapon, for: .normal)
        buttonTrunk.titleEdgeInsets = UIEdgeInsets(top: 30, left: -130, bottom: -70, right: -50)
        buttonTrunk.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), for: .normal)
        buttonTrunk.setImage(UIImage(named: weapon.name), for: .normal)
        buttonTrunk.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10)
        buttonTrunk.tag = 99
        
        if( player == 1 ){
            buttonTrunk.frame = CGRect(x: Constants.player1PosXToFight, y: Constants.player1PosYToFight - 110, width: 80, height: 80)
            
        } else {
            buttonTrunk.frame = CGRect(x: Constants.player2PosXToFight, y: Constants.player1PosYToFight - 110, width: 80, height: 80)
        }
        buttonTrunk.addTarget(self, action: #selector(takeNewWeapon), for: .touchUpInside)
        self.weaponInTrunk = weapon
        return buttonTrunk
    }
    enum Status {
        case waiting
        case goToFight
        case fighting
        case goToWaiting
    }
}

class Player {
    var id: Int!
    var name: String!
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class WeaponsFamily{
    var name: String!
    var value: Int!
    init(name: String, value: Int){
        self.name = name
        self.value = value
    }
}
class Knife: WeaponsFamily {
    init(){
        super.init(name: "knife.png", value: 1)
    }
}
class Hash: WeaponsFamily {
    init(){
        super.init(name: "hash.png", value: 7)
    }
}
class Gun: WeaponsFamily {
    init(){
        super.init(name: "gun.png", value: 5)
    }
}
class Submachine: WeaponsFamily {
    init(){
        super.init(name: "submachine.png", value: 9)
    }
}
class Sword: WeaponsFamily {
    init(){
        super.init(name: "sword.png", value: 3)
    }
}
class Dagger: WeaponsFamily {
    init(){
        super.init(name: "dagger.png", value: 2)
    }
}
// MARK: - Constants
enum Constants {
    static let maxHealth = 10
    static let imgPers = ["per1.png", "per2.png", "per3.png", "per4.png", "per5.png", "per6.png", "per7.png", "per8.png", "per9.png"]
    static let weaponsList = ["knife", "hash", "gun", "submachine", "sword", "dagger"]
    static let imgWidth: CGFloat = 80
    static let imgHeight: CGFloat = 80
    static let sizeCanvasWidth: Int = 1000
    static let sizeCanvasHeight: Int = 1000
    static let player1PosX: CGFloat = 30
    static let player1PosXToFight: CGFloat = 300
    static let player1PosYToFight: CGFloat = 300
    static let player2PosX: CGFloat = 650
    static let player2PosXToFight: CGFloat = 400
    static let player2PosYToFight: CGFloat = 300
    static let posYPerson1: CGFloat = 100
    static let numberOfPersonsByPlayer: Int = 3
    static let offsetPosYForEachPerson: CGFloat = 200
    static let randToShowTrunc: Int = 2 // 1:always <-> 10:never
    static let delayToKick = 2.0
    static let imgWidthForm = 50
    static let imgHeightForm = 50
    static let imgFormPersX = 340
    static let imgFormPers1y = 85
    static let imgFormPers11Y = 145
    static let imgFormPers12Y = 205
    static let imgFormPers13Y = 265
    static let imgFormPers2y = 387
    static let imgFormPers21Y = 427
    static let imgFormPers22Y = 487
    static let imgFormPers23Y = 547
    static let marginX = 40
    static let marginY = 20
    
    // names image
    static let nameImgRedcross = "redCross.png"
    static let nameImgTrunk = "trunkOpen.png"
    static let nameImgKick = "kick.png"
    static let nameImgQuestionMark = "questionMark2.png"
    static let nameImgBackground = "Grass.jpg"
    static let nameImgPerson = "per"
    static let nameImgPersonExtention = ".png"
    
    // Messages
    static let msgTakeThisWeapon = "Take this weapon"
    static let msgGameOver = "Game Over"
    static let msgContinue = "Continue..."
    static let msgReadyToFight = "Ready to Fight"
    static let strPourcent = "%"
    static let strTwoPoints = " : "
    static let strWinIn = " win in "
    static let strRoundAnd = " rounds, \nAnd "
    static let strPersonIsAlive = " person is alive"
    static let strPersonsAreAlive = " persons are alive"
    static let strOneHundredPercent = " : 100%"
    
    static func randImgPers() -> String? {
        let rand = Int.random(in: 0...imgPers.count)
        return imgPers[rand]
    }
    /*
     tag Number of : button OR image
        buttonPerson11 = 11
        ...
        buttonPerson23 = 23
     
        buttonTrunk = 99
     
        img[of person id] = 1xx (where xx = person.id)
     
        charactere = 1001 + [index] (9 images of characteres)
        
        textField (nameperson & player) = 11xx (where xx = person.id)

     */
}

