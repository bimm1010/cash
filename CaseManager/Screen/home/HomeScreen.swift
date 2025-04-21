    //
    //  HomeScreen.swift
    //  CaseManager
    //
    //  Created by Hoàng Nam on 17/4/25.
    //

import SwiftUI

struct HomeScreen: View {
    @State private var selectedTab: Int = 0
    @State private var changeColorButton: Bool = false
    @State private var currentDate: Date = Date()
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                InputViewCash(
                    changeColorButton: $changeColorButton,
                    currentDay: $currentDate
                )
            }
            .tabItem {
                Label("Nhập vào", systemImage: "pencil")
            }
            .tag(0)
            VStack {
                CalenderViewCash()
            }
            .tabItem {
                Label("Calender", systemImage: "calendar")
            }
            .tag(1)
            VStack {
                ChartViewCash()
            }
            .tabItem {
                Label("Chart", systemImage: "chart.pie")
            }
            .tag(2)
            VStack {
                MenuCash()
            }
            .tabItem {
                Label("Khác", systemImage: "ellipsis")
            }
            .tag(3)
        }
        .tint(.green)
    }
}


struct InputViewCash: View {
    @Binding var changeColorButton: Bool
    @Binding var currentDay: Date
    var body: some View {
        VStack {
            ButtonHeader(changeColorButton: $changeColorButton)
                .padding(.vertical, 5)
            Divider()
            DayViewSelect(currentDay: $currentDay)
            Divider()
            NoteMoneyOut()
            Divider()
            MoneyOutView()
            Divider()
            VStack {
                Text("Danh mục").font(.system(size: 20))
            }.frame(maxWidth: .infinity, alignment: .leading).padding(
                EdgeInsets(
                    top: GlobalConfig.GlobalPadding,
                    leading: GlobalConfig.GlobalPadding,
                    bottom: GlobalConfig.GlobalPadding,
                    trailing: GlobalConfig.GlobalPadding
                )
            )
            Spacer()
        }
    }
}

struct CalenderViewCash: View {
    var body: some View {
        Text("this is calender view")
    }
}

struct ChartViewCash: View {
    var body: some View {
        Text("this is chart view")
    }
}

struct MenuCash: View {
    var body: some View {
        Text("this is menu view")
    }
}


#Preview {
    HomeScreen()
}

            
            // Nhập vào screen
struct ButtonHeader: View {
    @Binding var changeColorButton: Bool
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Rectangle()
                    .frame(width: 240, height: 55)
                    .foregroundStyle(
                        Color(hex: GlobalConfig.colorBackgroundTheme)
                    )
                    .cornerRadius(10)
                    .overlay {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 100, height: 45)
                                    .foregroundColor(
                                        Color(
                                            hex: changeColorButton ? GlobalConfig
                                                .colorBackgroundTheme : GlobalConfig.colorTheme)
                                    )
                                    .onTapGesture {
                                        changeColorButton = false
                                    }
                                Text("Nhập tiền")
                                    .font(.headline)
                                    .foregroundStyle(
                                        Color(
                                            hex: changeColorButton ? GlobalConfig
                                                .colorTheme : GlobalConfig.colorWhite)
                                    )
                            }.padding(.horizontal, 5)
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 100, height: 45)
                                    .foregroundColor(
                                        Color(
                                            hex: changeColorButton ? GlobalConfig.colorTheme : GlobalConfig.colorBackgroundTheme
                                        )
                                    )
                                    .onTapGesture {
                                        changeColorButton = true
                                    }
                                Text("tiền thu")
                                    .font(.headline)
                                    .foregroundStyle(
                                        Color(hex: changeColorButton ? GlobalConfig.colorWhite : GlobalConfig.colorTheme)
                                    )
                            }.padding(.horizontal, 5)
                        }
                    }
            }
            Spacer()
            Button {
                print("")
            } label: {
                Image(systemName: "applepencil.and.scribble")
            }
        }.padding(.horizontal, 20)
    }
}

struct DayViewSelect: View {
    @Binding var currentDay: Date
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy (E)"
        formatter.locale = Locale(identifier: "vi_VN")
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text("Day")
                .font(.system(size: 16 ,weight: .medium))
                .foregroundStyle(.black)
            Button {
                currentDay = Calendar.current
                    .date(
                        byAdding: .day,
                        value: -1,
                        to: currentDay
                    ) ?? currentDay
            } label: {
                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
            }
            
            Text(dateFormatter.string(from: currentDay)).font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.green.opacity(0.1)) // Nền xanh nhạt
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Button {
                currentDay = Calendar.current
                    .date(
                        byAdding: .day,
                        value: 1,
                        to: currentDay
                    ) ?? currentDay
            } label: {
                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
            }

            
            
        }.padding(
            EdgeInsets(
                top: GlobalConfig.GlobalPadding,
                leading: GlobalConfig.GlobalPadding,
                bottom: GlobalConfig.GlobalPadding,
                trailing: GlobalConfig.GlobalPadding
            )
        )
    }
}

struct MoneyOutView: View {
    var body: some View {
        HStack {
            Text("Tiền chi").font(.system(size: 20))
            TextField("nhập tiền chi", text: .constant("0"))
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.system(size: 30, weight: .bold))
            Text("đ")
        }.padding(
            EdgeInsets(
                top: GlobalConfig.GlobalPadding,
                leading: GlobalConfig.GlobalPadding,
                bottom: GlobalConfig.GlobalPadding,
                trailing: GlobalConfig.GlobalPadding
            )
        )
    }
}


struct NoteMoneyOut: View {
    var body: some View {
        HStack {
            Text("Ghi chú").font(.system(size: 20))
            TextField("chưa nhập vào", text: .constant("")).font(.system(size: 30))
        }.padding(
            EdgeInsets(
                top: GlobalConfig.GlobalPadding,
                leading: GlobalConfig.GlobalPadding,
                bottom: GlobalConfig.GlobalPadding,
                trailing: GlobalConfig.GlobalPadding
            )
        )
    }
}
    //-------------------------------------//
