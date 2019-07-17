//
//  GameScene.swift
//  Project-Consolidation7
//
//  Created by Antoni on 17/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import SpriteKit
import GameplayKit

enum RowHeight: CGFloat {
    case top = 520
    case middle = 365
    case bottom = 210
}

enum RowZPosition: CGFloat {
    case top = 0
    case middle = 3
    case bottom = 5
}

class GameScene: SKScene {
    
    // Constants
    
    let leftStartingX: CGFloat = 50
    let rightStartingX: CGFloat = 1150
    
    let moveRightAction = SKAction.move(by: CGVector(dx: 1200, dy: 0), duration: 5.0)
    let moveLeftAction = SKAction.move(by: CGVector(dx: -1200, dy: 0), duration: 5.0)
    
    let gameFont = "Chalkduster"
    
    // Variables
    
    var addTargetTimer: Timer?
    var targetTimeInterval = 0.5
    
    var clip: SKSpriteNode!
    var ammo = 3 {
        didSet {
            clip.texture = SKTexture(imageNamed: "ammo\(ammo)")
        }
    }
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var gameTimer: Timer?
    var timerLabel: SKLabelNode!
    var timeRemaining = 60 {
        didSet {
            timerLabel.text = "Time: \(timeRemaining)"
        }
    }
    
    var targets: [SKSpriteNode] = []
    
    var gameOverLabel: SKLabelNode!
    var newGameLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "wood-background")
        background.blendMode = .replace
        background.zPosition = -1
        background.position = CGPoint(x: 512, y: 384)
        background.size = view.frame.size
        background.name = "background"
        addChild(background)
        
        let grass = SKSpriteNode(imageNamed: "grass-trees")
        grass.zPosition = 1
        grass.position = CGPoint(x: 512, y: 450)
        grass.size = CGSize(width: view.frame.width, height: grass.frame.height)
        grass.name = "background"
        addChild(grass)
        
        let waterbg = SKSpriteNode(imageNamed: "water-bg")
        waterbg.zPosition = 2
        waterbg.position = CGPoint(x: 512, y: 250)
        waterbg.size = CGSize(width: view.frame.width, height: waterbg.frame.height)
        waterbg.name = "background"
        addChild(waterbg)
        
        let waterfg = SKSpriteNode(imageNamed: "water-fg")
        waterfg.zPosition = 4
        waterfg.position = CGPoint(x: 512, y: 250)
        waterfg.size = CGSize(width: view.frame.width, height: waterfg.frame.height)
        waterfg.name = "background"
        addChild(waterfg)
        
        let animateWaterLeft = SKAction.move(by: CGVector(dx: -50, dy: 0), duration: 0.3)
        let animateWaterRight = SKAction.move(by: CGVector(dx: 50, dy: 0), duration: 0.3)
        
        let animateWaterLeftRight = SKAction.repeatForever(SKAction.sequence([animateWaterLeft, animateWaterRight]))
        let animateWaterRightLeft = SKAction.repeatForever(SKAction.sequence([animateWaterRight, animateWaterLeft]))
        
        waterfg.run(animateWaterLeftRight)
        waterbg.run(animateWaterRightLeft)
        
        let curtains = SKSpriteNode(imageNamed: "curtains")
        curtains.zPosition = 6
        curtains.position = CGPoint(x: 512, y: 384)
        curtains.size = view.frame.size
        curtains.name = "background"
        addChild(curtains)
        
        clip = SKSpriteNode(imageNamed: "ammo3")
        clip.zPosition = 7
        clip.position = CGPoint(x: 512, y: 740)
        clip.name = "clip"
        addChild(clip)
        
        timerLabel = SKLabelNode(text: "Time: 60")
        timerLabel.zPosition = 7
        timerLabel.position = CGPoint(x: 100, y: 725)
        timerLabel.fontName = gameFont
        timerLabel.fontSize = 40
        timerLabel.name = "background"
        addChild(timerLabel)
        
        scoreLabel = SKLabelNode(text: "Score: 0")
        scoreLabel.zPosition = 7
        scoreLabel.position = CGPoint(x: 900, y: 725)
        scoreLabel.fontName = gameFont
        scoreLabel.fontSize = 40
        scoreLabel.name = "background"
        addChild(scoreLabel)
        
        startGame()
    }
    
    func startGame() {
        
        run(SKAction.playSoundFileNamed("reload", waitForCompletion: false))
        
        score = 0
        ammo = 3
        timeRemaining = 60
        
        addTargetTimer?.invalidate()
        addTargetTimer = Timer.scheduledTimer(timeInterval: targetTimeInterval, target: self, selector: #selector(addTargetSprite), userInfo: nil, repeats: true)
        
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateGameTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func addTargetSprite() {
        
        let sprite: SKSpriteNode = randomTarget()
        sprite.physicsBody = SKPhysicsBody()
        sprite.physicsBody?.isDynamic = false
        
        switch Int.random(in: 0...2) {
        case 0: // top
            sprite.zPosition = RowZPosition.top.rawValue
            sprite.position = CGPoint(x: leftStartingX, y: RowHeight.top.rawValue)
            addChild(sprite)
            sprite.run(moveRightAction)
        case 1: // middle
            sprite.xScale = -1 // Flip to face left
            sprite.zPosition = RowZPosition.middle.rawValue
            sprite.position = CGPoint(x: rightStartingX, y: RowHeight.middle.rawValue)
            addChild(sprite)
            sprite.run(moveLeftAction)
        case 2: // bottom
            sprite.zPosition = RowZPosition.bottom.rawValue
            sprite.position = CGPoint(x: leftStartingX, y: RowHeight.bottom.rawValue)
            addChild(sprite)
            sprite.run(moveRightAction)
        default:
            break
        }
        
        targets.append(sprite)
    }
    
    func randomTarget() -> SKSpriteNode {
        
        var sprite: SKSpriteNode!
        
        switch Int.random(in: 0...9) {
        case 0...4: // Duck Good 50% chance
            sprite = SKSpriteNode(imageNamed: "target3")
            sprite.name = "goodDuck"
        case 5...8: // Duck Bad 40% chance
            sprite = SKSpriteNode(imageNamed: "target1")
            sprite.name = "badDuck"
        case 9: // Target 10% chance
            sprite = SKSpriteNode(imageNamed: "target0")
            sprite.name = "target"
            
        default:
            break
        }
        return sprite
    }
    
    func reload() {
        guard ammo == 0 else { return }
        ammo = 3
        run(SKAction.playSoundFileNamed("reload", waitForCompletion: false))
    }
    
    @objc
    func updateGameTimer() {
        timeRemaining -= 1
        if timeRemaining == 0 {
            gameOver()
        }
    }
    
    func gameOver() {
        gameTimer?.invalidate()
        addTargetTimer?.invalidate()
        
        for target in targets {
            target.removeFromParent()
        }
        
        targets.removeAll()
        
        gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontName = gameFont
        gameOverLabel.fontSize = 70
        gameOverLabel.zPosition = 8
        gameOverLabel.position = CGPoint(x: 512, y: 384)
        gameOverLabel.xScale = 0.001
        gameOverLabel.yScale = 0.001
        gameOverLabel.name = "background"
        addChild(gameOverLabel)
        
        let gameOverAppear = SKAction.scale(to: 1.0, duration: 0.5)
        gameOverLabel.run(gameOverAppear)
        
        newGameLabel = SKLabelNode(text: "New Game")
        newGameLabel.fontName = gameFont
        newGameLabel.fontSize = 50
        newGameLabel.zPosition = 8
        newGameLabel.position = CGPoint(x: 512, y: -50)
        newGameLabel.name = "newGame"
        addChild(newGameLabel)
        
        let newGameAppear = SKAction.move(to: CGPoint(x: 512, y: 70), duration: 0.5)
        
        newGameLabel.run(SKAction.sequence([SKAction.wait(forDuration: 1.0), newGameAppear]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let nodesAtPoint = nodes(at: location)
        
        if nodesAtPoint.contains(where: { $0.name == "newGame" }) {
            gameOverLabel.removeFromParent()
            newGameLabel.removeFromParent()
            startGame()
        }
        
        if nodesAtPoint.contains(where: { $0.name == "clip" }) {
            reload()
            return
        }
        
        // Shoot and return true if have ammo
        guard shoot(at: location) else { return }
        
        for case let node as SKSpriteNode in nodesAtPoint  {
            
            switch node.name {
            case "goodDuck":
                score += 5
                spriteHit(node: node)
            case "badDuck":
                score -= 20
                spriteHit(node: node)
            case "target":
                score += 20
                spriteHit(node: node)
            default:
                continue
            }
            
        }
    }
    
    func shoot(at position: CGPoint) -> Bool {
        
        if ammo > 0 {
            run(SKAction.playSoundFileNamed("shot", waitForCompletion: false))
            
            let crosshair = SKSpriteNode(imageNamed: "cursor")
            crosshair.zPosition = 8
            crosshair.position = position
            addChild(crosshair)
            
            let removeCrosshair = SKAction.run {
                crosshair.removeFromParent()
            }
            
            crosshair.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),removeCrosshair]))
            
            ammo -= 1
            return true
        } else {
            run(SKAction.playSoundFileNamed("empty", waitForCompletion: false))
            return false
        }
    }
    
    func spriteHit(node: SKSpriteNode) {
        
        node.removeAllActions()
        node.name = "hit"
        
        let reduceSize = SKAction.scale(by: 0.85, duration: 0.05)
        let applyGravity = SKAction.run {
            node.physicsBody?.isDynamic = true
        }
        
        let sequence = SKAction.sequence([
            reduceSize,
            SKAction.wait(forDuration: 0.2),
            applyGravity,
            SKAction.wait(forDuration: 2.0),
            SKAction.removeFromParent()
            ])
        
        node.run(sequence)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for (index, target) in targets.enumerated().reversed() {
            if target.position.x < 0 || target.position.x > 1200 || target.position.y < 0 {
                targets.remove(at: index)
                target.removeFromParent()
            }
        }
    }
}
