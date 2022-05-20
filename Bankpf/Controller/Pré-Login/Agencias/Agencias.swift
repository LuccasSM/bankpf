//
//  Agencias.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit
import CoreLocation
import MapKit

class Agencias: UIViewController {
    
    // MARK: Ajustando o Maps
    
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    
    let centerMapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "maps")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
        button.backgroundColor = .colorDefault
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
        title = "Agências"
        configureLocationManager()
        configureMapView()
        enableLocationServices()

    // MARK: Cores do navigatorBar

        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .colorDefault
            appearance.titleTextAttributes = [.foregroundColor: UIColor.grayDefault]
            navigationBar.scrollEdgeAppearance = appearance
        }

    // MARK: Botoes do navigatorBar

        let barButtonRight = UIBarButtonItem(customView: buttonRight)
        self.navigationItem.leftBarButtonItem = barButtonRight
        buttonRight.addTarget(self, action: #selector(returnButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 135),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),

            buttonRight.widthAnchor.constraint(equalToConstant: 17),
            buttonRight.heightAnchor.constraint(equalToConstant: 17),
        ])
    }

    // MARK: Views da tela

    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "logo"), for: UIControl.State.normal)
        return button
    }()

    private lazy var buttonRight: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
    }()
    
    // MARK: Itens relacionado ao Maps
    
    @objc func handleCenterLocation() {
        centerMapOnUserLocation()
        centerMapButton.alpha = 1
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    func configureMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        view.addSubview(centerMapButton)
        centerMapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
        centerMapButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        centerMapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.layer.cornerRadius = 50 / 2
        centerMapButton.alpha = 1
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(region, animated: true)
    }

    // MARK: Navegacoes da tela

    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

    // MARK: CLLocationManagerDelegate

extension Agencias: CLLocationManagerDelegate {
    
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("O status de autenticação do local NÃO É DETERMINADO")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("O status de autenticação do local é RESTRITO")
        case .denied:
            print("O status de autenticação do local é NEGADO")
        case .authorizedAlways:
            print("O status de autenticação do local é SEMPRE AUTORIZADO")
        case .authorizedWhenInUse:
            print("O status de autenticação do local é AUTORIZADO QUANDO EM USO")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        @unknown default:
            print("Erro no Maps")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard locationManager.location != nil else { return }
        centerMapOnUserLocation()
    }
}
