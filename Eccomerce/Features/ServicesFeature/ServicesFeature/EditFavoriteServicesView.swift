//
//  EditFavoriteServicesView.swift
//  ServicesFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 28/05/24.
//

import SwiftUI

struct ServiceModel {
    let id: UUID = UUID()
    let serviceName: String
    let serviceImage: String = "circle.fill"
}

class ServiceSectionModel: ObservableObject {
    let id: UUID = UUID()
    let serviceSectionName: String
    @Published var services: [ServiceModel]
    
    init(serviceSectionName: String, services: [ServiceModel]) {
        self.serviceSectionName = serviceSectionName
        self.services = services
    }
}

struct FavoriteServiceItemView: View {
    let serviceName: String
    let serviceImage: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: serviceImage)
            Text(serviceName).font(.caption)
        }
        .frame(width: 167, height: 56)
        .background(Color.white)
    }
}

struct ServiceItemView: View {
    let serviceName: String
    let serviceImage: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: serviceImage)
            Text(serviceName).font(.caption)
        }
        .frame(width: 62, height: 60)
        .background(Color.white)
    }
}

struct ServiceSectionView: View {
    @ObservedObject var model: ServiceSectionModel
    
    let moveServiceHanlder: (ServiceModel) -> Void
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 62))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.serviceSectionName).font(.title2)
            ScrollView(.horizontal) {
                LazyHGrid(rows: adaptiveColumn, spacing: 15) {
                    ForEach(model.services, id: \.id) { service in
                        ServiceItemView(
                            serviceName: service.serviceName,
                            serviceImage: service.serviceImage
                        )
                        .onTapGesture {
                            moveServiceHanlder(service)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    init(model: ServiceSectionModel,
         moveServiceHanlder: @escaping (ServiceModel) -> Void) {
        self.model = model
        self.moveServiceHanlder = moveServiceHanlder
    }
}

struct FavoriteServiceSectionView: View {
    @ObservedObject var model: ServiceSectionModel
    let descriptionSection: String?
    let removeFavoriteHandler: (ServiceModel) -> Void
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.serviceSectionName).font(.title2)
            if let descriptionSection = descriptionSection {
                Text(descriptionSection).font(.caption)
            }
            LazyHGrid(rows: adaptiveColumn, spacing: 15) {
                ForEach(model.services, id: \.id) { service in
                    FavoriteServiceItemView(
                        serviceName: service.serviceName,
                        serviceImage: service.serviceImage
                    )
                    .onTapGesture {
                        removeFavoriteHandler(service)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var isFavoriteSection: Bool {
        model.serviceSectionName.lowercased() == "tus favoritos"
    }
    
    init(model: ServiceSectionModel, 
         descriptionSection: String?,
         removeFavoriteHandler: @escaping (ServiceModel) -> Void) {
        self.model = model
        self.descriptionSection = descriptionSection
        self.removeFavoriteHandler = removeFavoriteHandler
    }
}

public struct EditFavoriteServicesView: View {
    let sectionsWithServices: [ServiceSectionModel] = [
        ServiceSectionModel(serviceSectionName: "Tus favoritos", services: [ServiceModel(serviceName: "Mesa de regalos"), ServiceModel(serviceName: "Teimpo aire y megas"), ServiceModel(serviceName: "Viajes liverpool"), ServiceModel(serviceName: "Asistencia por WhatsApp")]),
        ServiceSectionModel(serviceSectionName: "Mesa de regalos", services: [ServiceModel(serviceName: "Mesa de regalos")]),
        ServiceSectionModel(serviceSectionName: "Viajes y vacaciones", services: [ServiceModel(serviceName: "Viajes liverpool"), ServiceModel(serviceName: "El corte Inglés")]),
        ServiceSectionModel(serviceSectionName: "Servicios básico, tiempo aire y megas", services: [ServiceModel(serviceName: "Servicios Básicos"), ServiceModel(serviceName: "Tiempo aire y megas")]),
        ServiceSectionModel(serviceSectionName: "Centro de seguros", services: [ServiceModel(serviceName: "Centro de seguros"), ServiceModel(serviceName: "Mi seguro de autos"), ServiceModel(serviceName: "Gastos médicos"), ServiceModel(serviceName: "Pago por Kilómetro"), ServiceModel(serviceName: "Protección familiar")]),
    ]
    
    public var body: some View {
        VStack {
            ForEach(sectionsWithServices, id: \.id) { sectionService in
                if sectionService.serviceSectionName.lowercased() == "tus favoritos" {
                    FavoriteServiceSectionView(
                        model: sectionService,
                        descriptionSection: sectionDescription(model: sectionService),
                        removeFavoriteHandler: removeFavorite(service:)
                    )
                } else {
                    ServiceSectionView(model: sectionService, moveServiceHanlder: moveServiceHandler(service:))
                }

            }
        }
        .background(Color.gray)
    }
    
    private func sectionDescription(model sectionService: ServiceSectionModel) -> String? {
        if sectionService.serviceSectionName.lowercased() == "tus favoritos" {
            return "Puedes agregar un máximo de seis acciones rápidas"
        } else {
            return nil
        }
    }
    
    private func moveServiceHandler(service: ServiceModel) {
        for sectionsWithService in sectionsWithServices {
            if sectionsWithService.serviceSectionName.lowercased() == "tus favoritos" {
                sectionsWithService.services.append(service)
            }
        }
        
    }
    
    private func removeFavorite(service: ServiceModel) {
        print(service)
        for sectionsWithService in sectionsWithServices {
            if sectionsWithService.serviceSectionName.lowercased() == "tus favoritos" {
                let newFavoriteServices = sectionsWithService.services.filter { favServices in favServices.id != service.id }
                sectionsWithService.services = newFavoriteServices
            }
        }
    }
    
    public init() {}
}

#Preview {
    EditFavoriteServicesView()
}
