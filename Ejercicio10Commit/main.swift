import Foundation

// Estructura que representa una Sala de Reunión
struct SalaDeReunion {
    var nombre: String
    var capacidad: Int
    var fechaReserva: Date?  // Si no tiene fecha, está disponible
}
