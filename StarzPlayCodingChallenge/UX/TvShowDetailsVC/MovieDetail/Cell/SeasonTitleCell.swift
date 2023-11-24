//
//  SeasonCell.swift
//  CodingChallenge
//
//  Created by Apple on 22/11/2023.
//

import UIKit

class SeasonTitleCell: UICollectionViewCell {
    static let cellIndetifier = "SeasonTitleCell" /** cellIndetifier:  Cell Identifier **/
    
    @IBOutlet weak var lblTitle: UILabel! /** lblTitle :  Season title label **/
    @IBOutlet weak var viewVertical: UIView! /** viewVertical :  Right white line **/
    @IBOutlet weak var viewHorizontal: UIView! /** viewHorizontal :  below selected white line **/
    
    
    /** isSelected :  to implement the selection **/
    override var isSelected: Bool {
       didSet{
         if self.isSelected {
             self.viewHorizontal.backgroundColor = .white
         } else {
             self.viewHorizontal.backgroundColor = .black
        }
       }
    }
    
    /** setDataWith:  function to set data inside the cell **/
    func setDataWith(seasonNumber:Int) {
        lblTitle.text = "SEASON \(seasonNumber)"
    }
    
}
