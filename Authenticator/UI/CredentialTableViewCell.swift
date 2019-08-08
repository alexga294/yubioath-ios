//
//  CredentialTableViewCell.swift
//  Authenticator
//
//  Created by Irina Makhalova on 7/24/19.
//  Copyright © 2019 Irina Makhalova. All rights reserved.
//

import UIKit

class CredentialTableViewCell: UITableViewCell {

    @IBOutlet weak var issuer: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var progress: CircularProgressBar!
    @IBOutlet weak var touch: UIImageView!
    
    @objc dynamic private var credential: Credential?
    private var timerObservation: NSKeyValueObservation?

    override func awakeFromNib() {
        super.awakeFromNib()
        touch.isHidden = true
        progress.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateView(credential: Credential) {
        self.credential = credential
        var otp = credential.code
        // make it pretty by splitting in halves
        otp.insert(" ", at:  otp.index(otp.startIndex, offsetBy: otp.count / 2))
        code.text = otp
        issuer.text = credential.issuer
        name.text = credential.account
        
        if (credential.type == .TOTP && !credential.code.isEmpty) {
            touch.isHidden = true
            progress.isHidden = false
            refreshProgress()
            setupModelObservation()
        } else {
            progress.isHidden = true
            touch.isHidden = !credential.requiresTouch
        }
    }
    
    // MARK: - Model Observation
    
    private func setupModelObservation() {
        timerObservation = observe(\.credential?.remainingTime, options: [], changeHandler: { [weak self] (object, change) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.refreshProgress()
            }
        })
    }


    // MARK: - Refresh
    func refreshProgress() {
        guard let credential = self.credential else {
            return
        }
        if (credential.type == .TOTP && !credential.code.isEmpty) {
            if (credential.remainingTime > 0) {
                self.progress.setProgress(to: credential.remainingTime / Double(credential.period), duration: 0.0, withAnimation: false)
            } else {
                self.progress.setProgress(to: Double(0.0), duration: 0.0, withAnimation: false)
            }
                // TODO: add logic of changing color or timout expiration
        }
    }
}
