//
//  HJFlowLayout.swift
//  HJCustomCollectionViewLayout
//
//  Created by liuhj on 16/4/27.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

let HJItemWH : CGFloat = 100
let HJActiveDistsnce : CGFloat = 150
let HJScaleFactor : CGFloat = 0.8


class HJFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func prepareLayout() {
        super.prepareLayout()
        
        itemSize = CGSizeMake(HJItemWH, HJItemWH)
        scrollDirection = .Horizontal
        minimumLineSpacing = HJItemWH
        let inset = ((self.collectionView?.frame.size.width)! - HJItemWH) * 0.5
        sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
        
    }
    
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var lastRect : CGRect? = CGRectZero
        lastRect?.size = (self.collectionView?.frame.size)!
        lastRect?.origin = proposedContentOffset
        
        let array = super.layoutAttributesForElementsInRect(lastRect!)
        
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.size.width)! * 0.5
        var adjustOffsetX : CGFloat = CGFloat(MAXFLOAT)
        
        for attrs in array! {
            if abs(attrs.center.x - centerX) < abs(adjustOffsetX) {
                adjustOffsetX = attrs.center.x - centerX
            }
        }
        

        return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y)
        
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibaleRect : CGRect? = CGRectZero
//        visibaleRect?.size = (self.collectionView?.frame.size)!
//        visibaleRect?.origin = (self.collectionView?.contentOffset)!
        visibaleRect = CGRectMake(0, 0, 414, 200)
        let array = super.layoutAttributesForElementsInRect(rect)
//        var arrayCopy = [UICollectionViewLayoutAttributes]()
        let centerX = (self.collectionView?.contentOffset.x)! + (self.collectionView?.frame.size.width)! * 0.5
        
        for attri in array! {
            if CGRectIntersectsRect(visibaleRect!, attri.frame) {
                continue
            }
            let itemCenterX = attri.center.x
            let scale = 1 + HJScaleFactor * (1 - abs(itemCenterX - centerX) / HJActiveDistsnce)
            attri.transform3D = CATransform3DMakeScale(scale, scale, 1)
//            let attriCopy = attri.copy() as! UICollectionViewLayoutAttributes
//            arrayCopy.append(attriCopy)
        }
        
        return array
        
    }
    
    
}
