//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit


public var sceneIndex = 1
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}


PlaygroundPage.current.liveView = sceneView
