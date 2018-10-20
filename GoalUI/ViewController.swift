//
//  ViewController.swift
//  GoalUI
//
//  Created by MacBook on 19.10.2018.
//  Copyright © 2018 Bizz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*      Путем вычислений нашел центр экрана и решил оцентроваться на расстоянии по 50 от краев,
         то есть размер size первого квадрата будет 314 =  414 - 2*50. Отсюда и начальные координаты х=50, у=291 для его прорисовки.
         Далее динамически вычисляем сдвиг shift (расстояние между квадратами\кругами) к центру зависимости от количества квадратиков(кругов).
         Расстояние до центра составляет 157, поэтому shift = 157 / count.
         Эти значения (x,y,size) забиты в функции рисовать квадратную цель targetUiSquare (использует drawBox) и рисовать круглую цель targetUIRound (использует drawCircle).
         Выходит, что мы рисуем каждый следующий квадрат (круг) увeличивая координаты на shift,  размер кубика уменьшаем на 2*shift. Так же уменьшаем расстояние к центру (157) на shift пока оно >shift. Для того, чтобы сделать из квадрата круг подобрал для самого первого значение cornerRaduis 157 ( omg, совпало с расстоянием до центра 0_о), и далее при каждой следующей итерации уменьшаем его тоже на shift
*/
        // targetUiSquare(7)
        targetUIRound(10)
        
   
        
    }
    // рисует квадрат, с тремя аргументами: размер и две коордианты
    func drawBox(_ size:Int, _ x:Int, _ y:Int) {
        let cube = CGRect.init(x: x, y: y, width: size, height: size)
        let box = UIView(frame: cube)
        box.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                      green: CGFloat(arc4random_uniform(256))/255,
                                      blue: CGFloat(arc4random_uniform(256))/255,
                                      alpha: 1)
        view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                       green: CGFloat(arc4random_uniform(256))/255,
                                       blue: CGFloat(arc4random_uniform(256))/255,
                                       alpha: 1)
        view.addSubview(box)
    }
    
    // рисует круг из квадрата, с четырьмя аргументами : размер, две коордианты и радиус скругливания
    func drawCircle(_ size:Int, _ x:Int, _ y:Int, _ cornerRaduis:CGFloat) {
        let cube = CGRect.init(x: x, y: y, width: size, height: size)
        let box = UIView(frame: cube)
        box.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                      green: CGFloat(arc4random_uniform(256))/255,
                                      blue: CGFloat(arc4random_uniform(256))/255,
                                      alpha: 1)
        view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                       green: CGFloat(arc4random_uniform(256))/255,
                                       blue: CGFloat(arc4random_uniform(256))/255,
                                       alpha: 1)
        box.layer.cornerRadius = cornerRaduis
        view.addSubview(box)
    }
    
    
    func targetUiSquare(_ count: Int) {
        var size = 314 // устанавливаем начальные параметры после вычислений
        var x = 50
        var y = 291
        let shift = 157 / count // шаг движения к центру исходя и количества квадратов
        var movingToCenter = 157
        while movingToCenter > shift {
            drawBox(size, x, y) //рисуем квадрат, уменьшаем размер, сдвигаемся по координатам
            size-=2*shift
            x+=shift
            y+=shift
            movingToCenter-=shift
        }
    }
    
    func targetUIRound(_ count: Int) {
        var size = 314
        var x = 50
        var y = 291
        var cornerRadius: CGFloat = 157
        let shift = 157 / count
        var movingToCenter = 157
        while movingToCenter > shift {
            drawCircle(size, x, y,cornerRadius)
            size-=2*shift
            x+=shift
            y+=shift
            movingToCenter-=shift
            cornerRadius-=CGFloat(shift)
            print(shift, size)
        }
    }
    
    
}



