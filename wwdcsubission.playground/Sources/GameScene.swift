import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
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
    
    var verificador = false
    var level: Int = 0
    
    
    
    public override func didMove(to view: SKView) {
        removeAllChildren()
        backgroundColor = SKColor.white
        label0.alpha = 1
        addChild(label0)
        
        
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if let scene2 = GameScene2(fileNamed: "GameScene2") {
            scene2.scaleMode = .aspectFill
            self.view?.presentScene(scene2)
            
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
        
        
    }
}

