//
//  ViewController.swift
//  PracticeArkitMeasure
//
//  Created by Kenshiro on 2021/01/16.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
@IBOutlet var sceneView: ARSCNView!
@IBOutlet var label: UILabel!
    
var centerPos = CGPoint(x: 0, y: 0)
    
override func viewDidLoad() {
    super.viewDidLoad()
    sceneView.delegate = self
    
    // シーンを作成
    sceneView.scene = SCNScene()
    
    // 画面中央の座標を保存
    centerPos = sceneView.center
    
    // セッションを開始する
    let configuration = ARWorldTrackingConfiguration()
    sceneView.session.run(configuration)
    }
    
    // 毎フレーム呼ばれる関数
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time:
    TimeInterval) {
        
    // 画面中央部分と特徴点との当たり判定
    let hitResults = sceneView.hitTest(centerPos, types:
    [.featurePoint])
    // 結果取得に成功しているかどうか
    if !hitResults.isEmpty {
    if let hitTResult = hitResults.first {
    let distance = hitTResult.distance;
    // 当たっていたら距離を表示する
    DispatchQueue.main.async {
        self.label.text = String(format:"%.1f", distance*100) + "cm"}
            }
        }
    }
}
