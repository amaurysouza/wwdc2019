import PlaygroundSupport
import SpriteKit

public class GameScene2: SKScene, SKPhysicsContactDelegate {
    
    
    let player = SKSpriteNode(imageNamed: "player.png")
    var boaDecisao : SKSpriteNode!
    var maDecisao: SKSpriteNode!
    var mascaraBoaDecisao: UInt32 = 0x1 << 0
    var mascaraMaDecisao: UInt32 = 0x1 << 1
    var mascaraPlayer: UInt32 = 0x1 << 2
    
    var label0 = SKSpriteNode(imageNamed: "label0.png")
    var label1 = SKSpriteNode(imageNamed: "label1.png")
    var label2 = SKSpriteNode(imageNamed: "label2.png")
    var label3 = SKSpriteNode(imageNamed: "label3.png")
    var label4 = SKSpriteNode(imageNamed: "label4.png")
    var label5 = SKSpriteNode(imageNamed: "label5.png")
    var label6 = SKSpriteNode(imageNamed: "label6.png")
    var label7 = SKSpriteNode(imageNamed: "label7.png")
    var label8 = SKSpriteNode(imageNamed: "label8.png")
    var label9 = SKSpriteNode(imageNamed: "label9.png")
    var timer = Timer()
    
    var verificador = false
    var level: Int = 0
    
    
    
    public override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        label1.alpha = 0
        addChild(label1)
        label2.alpha = 0
        addChild(label2)
        
        
        boaDecisao = childNode(withName: "//boaDecisao1") as? SKSpriteNode
        maDecisao = childNode(withName: "//maDecisao1") as? SKSpriteNode
        
        backgroundColor = SKColor.white
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        player.size = CGSize(width: 50, height: 50)
        player.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        player.physicsBody?.categoryBitMask = mascaraPlayer
        player.physicsBody?.contactTestBitMask = mascaraMaDecisao | mascaraBoaDecisao
        boaDecisao.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        boaDecisao.physicsBody?.categoryBitMask = mascaraBoaDecisao
        
        
        maDecisao.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        maDecisao.physicsBody?.categoryBitMask = mascaraMaDecisao
        boaDecisao.physicsBody?.affectedByGravity = false
        boaDecisao.physicsBody?.isDynamic = false
        
        maDecisao.physicsBody?.affectedByGravity = false
        addChild(player)
        maDecisao.physicsBody?.isDynamic = false
        
        
        
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if verificador == true{
            if let scene3 = GameScene3(fileNamed: "GameScene3") {
                scene3.scaleMode = .aspectFill
                self.view?.presentScene(scene3)
               
            }
        }
        
        if(pos.x > 0.000001){
            player.physicsBody?.applyForce(CGVector(dx: 65.0, dy: 0.0))
        } else {
            player.physicsBody?.applyForce(CGVector(dx: -100.0, dy: 0.0))
            
        }
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.categoryBitMask == mascaraPlayer && contact.bodyB.categoryBitMask == mascaraMaDecisao || contact.bodyA.categoryBitMask == mascaraMaDecisao && contact.bodyB.categoryBitMask == mascaraPlayer){
            //imprimir meu texto para esta situação
            
            
            label1.alpha = 1
            
            player.removeFromParent()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Change `2.0` to the desired number of seconds.
                // Code you want to be delayed
                self.verificador = true
            }
//            verificador = true
            

        }
        if (contact.bodyA.categoryBitMask == mascaraPlayer && contact.bodyB.categoryBitMask == mascaraBoaDecisao || contact.bodyA.categoryBitMask == mascaraBoaDecisao && contact.bodyB.categoryBitMask == mascaraPlayer){
            //imprimir meu texto para esta situação
            player.removeFromParent()
            label2.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Change `2.0` to the desired number of seconds.
                // Code you want to be delayed
                self.verificador = true
            }
//            verificador = true
            
        }
    }
}

