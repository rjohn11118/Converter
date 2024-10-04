import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    @State private var inputValue = 0.0

    let units = ["Celsius", "Fahrenheit", "Kelvin"]

    var convertedValue: Double {
        var value = inputValue

        if inputUnit == "Fahrenheit" {
            value = (inputValue - 32) * 5 / 9
        } else if inputUnit == "Kelvin" {
            value = inputValue - 273.15
        }

        if outputUnit == "Fahrenheit" {
            return value * 9 / 5 + 32
        } else if outputUnit == "Kelvin" {
            return value + 273.15
        } else {
            return value
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Enter temperature to convert")) {
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Select input unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Select output unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Converted value")) {
                    Text("\(convertedValue.formatted())")
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

#Preview {
    ContentView()
}
