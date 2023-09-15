
import SwiftUI
struct ContentView: View {
    @State private var selectedOneIndex = 0
    @State private var selectedTwoIndex = 1
    @State private var input = 0.0
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var count: Double {
        let inputValue = input
        
        let inputUnit = temperatureUnits[selectedOneIndex]
        let outputUnit = temperatureUnits[selectedTwoIndex]
        
        let c: Double
        
        if inputUnit == "Fahrenheit" {
            c = (inputValue - 32) * 5/9
        } else if inputUnit == "Kelvin" {
            c = inputValue - 273.15
        } else {
            c = inputValue
        }
        
        var output = 0.0
        
        if outputUnit == "Celsius" {
            output = c
        } else if outputUnit == "Fahrenheit" {
            output = (c * 9/5) + 32
        } else if outputUnit == "Kelvin" {
            output = c + 273.15
        } else {
            output = c
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("1st Temperature ")) {
                    TextField("Enter temperature", value: $input, format: .number)

                    Picker("Select temperature one", selection: $selectedOneIndex) {
                        ForEach(0..<temperatureUnits.count) { index in
                            Text(temperatureUnits[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("2nd Temperature ")) {
                    Picker("Select temperature two", selection: $selectedTwoIndex) {
                        ForEach(0..<temperatureUnits.count) { index in
                            Text(temperatureUnits[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(count.formatted())")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
