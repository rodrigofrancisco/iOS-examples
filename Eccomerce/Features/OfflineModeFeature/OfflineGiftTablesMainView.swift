//
//  OfflineGiftTablesMainView.swift
//  OfflineModeFeature
//
//  Created by RODRIGO FRANCISCO PABLO on 24/06/24.
//

import SwiftUI

public struct GiftTableEventModel {
    public let eventName: String
    public var eventNumber: String
    public let eventType: String
    public let celebrated: [String]?
    public let date: String?
    
    public init(eventName: String, eventNumber: String, eventType: String, celebrated: [String]?, date: String?) {
        self.eventName = eventName
        self.eventNumber = eventNumber
        self.eventType = eventType
        self.celebrated = celebrated
        self.date = date
    }
}

public struct OfflineGiftTablesMainView: View {
    private let events: [GiftTableEventModel]
    @State private var eventSelected: GiftTableEventModel?
    
    public var body: some View {
        VStack {
            ForEach(events, id: \.eventNumber) { event in
                getEventView(event: event)
            }
            .padding(.bottom, 10)
        }
        .padding()
        .background(.gray)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func getEventView(event: GiftTableEventModel) -> some View {
        if eventSelected?.eventNumber == event.eventNumber {
            AnyView(GiftTableEventDetailView(model: event)
                .onTapGesture {
                    handleAction(model: nil)
                }
            )
        } else {
            AnyView(GiftTableEventHeaderView(evenTitle: event.eventName)
                .onTapGesture {
                    handleAction(model: event)
                }
            )
        }
    }
    
    public init(events: [GiftTableEventModel]) {
        self.events = events
        self._eventSelected = State(wrappedValue: self.events.first)
    }
    
    private func handleAction(model: GiftTableEventModel?) {
        self.eventSelected = model
    }
}

struct GiftTableEventHeaderView: View {
    private let evenTitle: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "photo.fill")
                .frame(width: 42, height: 42)
                .background(.green)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 2) {
                Text(evenTitle)
                    .bold()
            }
            Spacer()
            Image(systemName: "chevron.down")
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
        .frame(height: 68)
    }
    
    init(evenTitle: String) {
        self.evenTitle = evenTitle
    }
}

struct GiftTableEventDetailView: View {
    private let model: GiftTableEventModel
    
    private enum K {
        static let celebratedCardTitle = "Tarjeta del festejado"
        static let cardHelpInstructions = "El vendedor debe escanear este código para abonar tus compras a tu Mesa de Regalos"
    }
    
    var body: some View {
        VStack {
            headerView
            Divider().padding([.leading, .trailing], 15)
            barcodeDetails
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
    }
    
    var barcodeDetails: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(K.celebratedCardTitle)
            Text(K.cardHelpInstructions).font(.caption)
            Image(systemName: "photo.fill")
                .frame(maxWidth: .infinity, maxHeight: 146)
                .border(Color.black, width: 1)
                .background(Color.green)
            HStack {
                Spacer()
                Text(model.eventNumber)
                Spacer()
            }
        }.padding()
    }
    
    var headerView: some View {
        HStack(alignment: .top) {
            Image(systemName: "photo.fill")
                .frame(width: 68, height: 68)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.trailing, 10)
                .padding(.top, 10)
                
            VStack(alignment: .leading, spacing: 2) {
                Text(model.eventName)
                    .bold()
                ForEach(model.celebrated ?? [], id: \.self) { celebrated in
                    Text(celebrated)
                }
                if let date = model.date {
                    Text(date)
                }
            }
            Spacer()
            Image(systemName: "chevron.up").padding(.top, 4)
        }.padding()
    }
    
    init(model: GiftTableEventModel) {
        self.model = model
    }
}

#Preview {
    OfflineGiftTablesMainView(events: events)
}

let events = [
    GiftTableEventModel(eventName: "Boda en León", eventNumber: "123123123123", eventType: "Aniversario", celebrated: ["Ana Cecilia Torrees", "Maximo Moralex Tellez"], date: "20/04/2024"),
    GiftTableEventModel(eventName: "Cumple Caro", eventNumber: "234234234234", eventType: "Aniversario", celebrated: ["Ana Cecilia Torres"], date: "20/04/2024")
]
