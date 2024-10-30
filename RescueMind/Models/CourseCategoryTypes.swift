//
//  CourseSectionTypes.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 23.10.2024.
//

import Foundation

enum CourseCategoryTypes : CaseIterable, Identifiable {
    
    var id : CourseCategoryTypes { self }
    case accidents
    case naturalDisasters
    case healthEmergencies
    case crimeIncidents
    case firesAndExplosions
    
    var categoryTitle : String {
        switch self {
        case .accidents:
            return "Accidents"
        case .naturalDisasters:
            return "Natural Disasters"
        case .healthEmergencies:
            return "Health Emergencies"
        case .crimeIncidents:
            return "Crime Incidents"
        case .firesAndExplosions:
            return "Fires and Explosions"
        }
    }
    
    var categoryCourses : [CourseModel] {
        switch self {
        case .accidents:
            [
                CourseModel(
                    id: "accidents_1",
                    courseTitle: "Traffic Accidents",
                    courseDescription: "Traffic accidents can be chaotic and stressful. When receiving a call, start by staying calm and asking for the exact location of the accident. The first few moments are critical, so ensure you gather information on the number of vehicles involved, potential injuries, and if anyone is trapped inside. Guide the caller to check for consciousness and breathing, and inform them about the importance of not moving injured persons unless absolutely necessary due to a life-threatening situation like fire or explosion. Offer instructions on providing basic first aid, such as stopping any visible bleeding and reassuring the victim.",
                    courseImage: "traffic_accident",
                    courseKeyPoints: [
                        "Annual global traffic accidents: 1.35 million deaths.",
                        "Most common injury: Head trauma",
                        "Response time: Under 6 minutes crucial for survival"
                    ],
                    courseCriticalSteps: [
                        "Verify location and surrounding landmarks",
                        "Determine if there are any critically injured individuals",
                        "Keep the caller calm and provide guidance"
                    ]
                ),
                CourseModel(
                    id: "accidents_2",
                    courseTitle: "Workplace Accidents",
                    courseDescription: "Workplace accidents can range from minor injuries to life-threatening situations. Begin by identifying the type of accident and the victim's condition. If it's a fall, ask about the height and whether the person is responsive. In the case of chemical exposure, request immediate flushing of the area with clean water. For equipment-related injuries, advise on whether to stop machinery if safe and keep the victim still. Reassure the caller and provide guidance on stabilizing the situation until emergency services arrive.",
                    courseImage: "workplace_accident",
                    courseKeyPoints: [
                        "Most common workplace injury: Slips and falls",
                        "Fatal incidents per year: 2.8 million",
                        "Response effectiveness: 90% with rapid intervention"
                    ],
                    courseCriticalSteps: [
                        "Identify the type of accident and immediate hazards",
                        "Confirm if the injured person is breathing and conscious",
                        "Provide initial first-aid advice if safe"
                    ]
                ),
                CourseModel(
                    id: "accidents_3",
                    courseTitle: "Home Accidents",
                    courseDescription: "Home accidents are common and can be frightening for unprepared individuals. If you receive a call regarding a burn, guide the caller to immediately cool the burn under running water and avoid using ice or butter. For falls, assess whether the victim is alert and has any visible injuries, particularly head trauma or broken bones. Advise on keeping the victim still if spinal injury is suspected. Reinforce the importance of remaining calm and waiting for help, while providing any immediate care, such as applying pressure to stop bleeding.",
                    courseImage: "home_accident",
                    courseKeyPoints: [
                        "Top cause of home accidents: Falls",
                        "Percentage of child-related accidents: 40%",
                        "Home injury deaths annually: 18,000+"
                    ],
                    courseCriticalSteps: [
                        "Confirm the nature of the accident (falls, cuts, etc.)",
                        "Ensure no immediate dangers remain",
                        "Give quick first-aid guidance based on injury severity"
                    ]
                ),
                CourseModel(
                    id: "accidents_4",
                    courseTitle: "Sports Accidents",
                    courseDescription: "Sports injuries can be severe and require quick intervention. When someone calls about a sports-related accident, ask about the nature of the injury—whether it involves a break, sprain, or concussion. For head injuries, recommend the individual remains still and monitors for signs of confusion, vomiting, or unconsciousness. In cases of fractures, instruct the caller to immobilize the injured area and avoid moving the victim. Offer reassurance and instruct the caller to monitor the victim's condition while awaiting emergency personnel.",
                    courseImage: "sports_accident",
                    courseKeyPoints: [
                        "Most common sports injury: Sprains and strains",
                        "Annual sports injury cases: 3.5 million",
                        "Concussion rate: 10% in contact sports"
                    ],
                    courseCriticalSteps: [
                        "Verify if the injury involves impact or strain",
                        "Check if there’s any head, neck, or spinal injury",
                        "Advise minimal movement if serious injury is suspected"
                    ]
                )
            ]
        case .naturalDisasters:
            [
                CourseModel(
                    id: "naturalDisasters_1",
                    courseTitle: "Earthquakes",
                    courseDescription: "Earthquakes can cause panic and confusion. When you receive an earthquake-related call, the first step is to ensure the caller's safety. Advise them to take cover under sturdy furniture if inside or move to an open area if outside. Encourage them to avoid elevators and to move away from windows or unstable structures. After the initial tremor, instruct the caller to be aware of aftershocks and check for injuries. If buildings are damaged, advise evacuation only if safe, and to assist others in need of help.",
                    courseImage: "earthquake",
                    courseKeyPoints: [
                        "Annual earthquake fatalities: 20,000+",
                        "Time to act after tremors: 30 seconds",
                        "Preparedness reduces fatalities: 50%"
                    ],
                    courseCriticalSteps: [
                        "Confirm if the caller is in a safe location",
                        "Instruct to stay under sturdy furniture or move to open areas",
                        "Avoid elevators and confirm any injuries"
                    ]
                ),
                CourseModel(
                    id: "naturalDisasters_2",
                    courseTitle: "Floods",
                    courseDescription: "Floods can escalate rapidly, putting lives at risk. When responding to a flood emergency, guide the caller to move to higher ground immediately, avoiding any attempt to walk or drive through flooded areas. Ensure they understand the dangers of strong currents, even in shallow water, and instruct them to stay clear of downed power lines or electrical equipment that could cause electrocution. If someone is trapped, ask for details about their location and provide instructions on how to stay safe until rescuers arrive.",
                    courseImage: "flood",
                    courseKeyPoints: [
                        "Top cause of flood deaths: Drowning",
                        "Average flood response time: 15-30 minutes",
                        "Annual economic losses: $10 billion"
                    ],
                    courseCriticalSteps: [
                        "Advise the caller to move to higher ground if safe",
                        "Confirm if anyone is trapped or needs immediate assistance",
                        "Instruct on avoiding flooded roads and power lines"
                    ]
                ),
                CourseModel(
                    id: "naturalDisasters_3",
                    courseTitle: "Fires",
                    courseDescription: "House fires spread quickly, making fast, decisive action essential. Start by asking if anyone is trapped inside and gathering information on their location. Instruct the caller to get low to the ground to avoid smoke inhalation and to use the back of their hand to test doors for heat before opening them. If the fire is small and manageable, provide guidance on how to safely use a fire extinguisher. For larger fires, emphasize evacuation and encourage the caller to leave all belongings behind, focusing on their safety first.",
                    courseImage: "fire",
                    courseKeyPoints: [
                        "Annual fire fatalities: 3,500",
                        "Fire starts from cooking accidents: 48%",
                        "Smoke inhalation death rate: 80%"
                    ],
                    courseCriticalSteps: [
                        "Ensure the caller moves to a safe area away from smoke",
                        "Confirm if anyone is trapped inside",
                        "Advise against using elevators and staying low to avoid smoke"
                    ]
                ),
                CourseModel(
                    id: "naturalDisasters_4",
                    courseTitle: "Storms and Hurricanes",
                    courseDescription: "Severe storms and hurricanes can lead to extensive damage and danger. When assisting in such cases, advise the caller to secure shelter in a windowless room, away from external walls. If evacuation orders are in place, guide them to follow official instructions promptly, taking essentials with them. For individuals stranded in floodwaters or high winds, offer advice on staying in place and waiting for rescue, while avoiding hazardous conditions like downed trees and power lines.",
                    courseImage: "storm_and_hurricanes",
                    courseKeyPoints: [
                        "Hurricane season fatalities: 10,000+ globally",
                        "Wind speed to cause destruction: 74 mph+",
                        "Flooding from hurricanes: 85% of damages"
                    ],
                    courseCriticalSteps: [
                        "Advise moving to an interior room or basement",
                        "Confirm if the caller has emergency supplies nearby",
                        "Instruct to stay away from windows and doors"
                    ]
                )
            ]
        case .healthEmergencies:
            [
                CourseModel(
                    id: "healthEmergencies_1",
                    courseTitle: "Heart Attacks",
                    courseDescription: "Time is critical during a heart attack. Upon receiving such a call, instruct the caller to help the victim sit down, lean forward, and remain calm. If the victim is unconscious, guide the caller through CPR instructions, starting with chest compressions. If an Automated External Defibrillator (AED) is available, talk the caller through its use. Ensure the caller knows the importance of continuing compressions until professional help arrives, as even brief interruptions can reduce the chances of survival.",
                    courseImage: "heart_attack",
                    courseKeyPoints: [
                        "Annual heart attack deaths: 17.9 million",
                        "CPR success rate: 45% with immediate action",
                        "Survival window: 4-6 minutes after the attack"
                    ],
                    courseCriticalSteps: [
                        "Advise the caller to have the patient sit and stay calm",
                        "Confirm if the patient has any chest pain or difficulty breathing",
                        "Instruct to administer aspirin if no allergies and direct immediate medical help"
                    ]
                ),
                CourseModel(
                    id: "healthEmergencies_2",
                    courseTitle: "Drowning",
                    courseDescription: "Drowning calls are highly time-sensitive. First, ensure the safety of the rescuer and instruct them to remove the victim from the water. Once the victim is out of the water, ask the caller to check if the person is breathing. If not, guide them through rescue breathing techniques and chest compressions if necessary. Keep the caller calm while helping them provide mouth-to-mouth resuscitation, focusing on restoring breathing until emergency responders arrive.",
                    courseImage: "drowning",
                    courseKeyPoints: [
                        "Drowning deaths annually: 320,000",
                        "Child drowning rate: 50% under 5 years old",
                        "Immediate rescue impact: Increases survival by 70%"
                    ],
                    courseCriticalSteps: [
                        "Confirm if the person is breathing; if not, guide on CPR steps",
                        "Advise to keep the person warm after rescue",
                        "Ensure no more water intake and check for other injuries"
                    ]
                ),
                CourseModel(
                    id: "healthEmergencies_3",
                    courseTitle: "Poisoning",
                    courseDescription: "In cases of poisoning, the type of substance involved is critical. Ask the caller for details about what was ingested, inhaled, or touched. If the poison is inhaled, instruct the caller to move the victim to fresh air immediately. For ingestion, avoid giving food or drinks unless directed by a poison control center. Emphasize the need to keep the victim still and calm while waiting for medical assistance, and reassure the caller that help is on the way.",
                    courseImage: "poisoning",
                    courseKeyPoints: [
                        "Annual poisoning deaths: 100,000+",
                        "Most common poisoning source: Household cleaners",
                        "Response time impact: 5-minute delay reduces survival by 30%"
                    ],
                    courseCriticalSteps: [
                        "Identify the substance and amount ingested, if possible",
                        "Instruct the caller not to induce vomiting unless advised",
                        "Provide emergency contacts for poison control"
                    ]
                ),
                CourseModel(
                    id: "healthEmergencies_4",
                    courseTitle: "Fainting and Shock",
                    courseDescription: "Fainting and shock require swift attention to prevent further health complications. Advise the caller to keep the victim lying down with their legs elevated to improve blood flow. Check the victim's responsiveness and ask about any underlying health conditions that might have triggered the episode. If the person is conscious but confused, encourage them to remain still and calm while monitoring their breathing and pulse.",
                    courseImage: "fainted",
                    courseKeyPoints: [
                        "Annual cases of shock: 1.5 million",
                        "Success rate with proper first aid: 95%",
                        "Top causes: Blood loss, allergic reactions"
                    ],
                    courseCriticalSteps: [
                        "Instruct to lie the person down and elevate their legs slightly",
                        "Check for breathing and any visible injuries",
                        "Advise to keep the person calm and comfortable until help arrives"
                    ]
                )
            ]
        case .crimeIncidents:
            [
                CourseModel(
                    id: "crimeIncidents_1",
                    courseTitle: "Assault",
                    courseDescription: "Assault situations can be highly charged and dangerous. When receiving such a call, instruct the caller to ensure their own safety first by moving to a secure location if possible. Ask about the extent of the injuries and provide basic first aid instructions, such as applying pressure to wounds. Encourage the caller to document any details about the assailant while staying on the line with emergency services.",
                    courseImage: "assault",
                    courseKeyPoints: [
                        "Annual assault victims: 1 million+",
                        "Assault survival rate: 90% with immediate help",
                        "Response time: Crucial within 5 minutes"
                    ],
                    courseCriticalSteps: [
                        "Confirm if the caller or victim is safe from immediate harm",
                        "Advise on staying in a safe location until help arrives",
                        "Collect details about the incident and any injuries sustained"
                    ]
                ),
                CourseModel(
                    id: "crimeIncidents_2",
                    courseTitle: "Robbery",
                    courseDescription: "Robberies can escalate quickly, and staying calm is key. Instruct the caller to comply with the robber’s demands and avoid sudden movements. If safe, guide them to quietly observe identifying features of the suspect for later reporting. Once the robbery is over, advise the caller to stay where they are and wait for the police to arrive while keeping others away from the scene to preserve evidence.",
                    courseImage: "robbery",
                    courseKeyPoints: [
                        "Annual robbery cases: 250,000",
                        "Economic losses: $5 billion/year",
                        "Successful resolution rate: 65%"
                    ],
                    courseCriticalSteps: [
                        "Instruct the caller to stay calm and avoid confronting the suspect",
                        "Confirm if the suspect has left the location",
                        "Advise on keeping any evidence and contacting law enforcement"
                    ]
                ),
                CourseModel(
                    id: "crimeIncidents_3",
                    courseTitle: "Domestic Violence",
                    courseDescription: "Domestic violence is a sensitive and dangerous situation. Encourage the caller to find a safe place away from the abuser, if possible, and avoid direct confrontation. Ask if there are any visible injuries and offer basic first aid advice if needed. If children are involved, ensure their safety is prioritized. It’s important to remain calm and supportive, providing the caller with reassurance that help is on the way. Advise them to document any details they feel comfortable sharing, but emphasize their safety above all else.",
                    courseImage: "domestic_violence",
                    courseKeyPoints: [
                        "Domestic violence reports: 10 million/year",
                        "Victims that seek help: 35%",
                        "Fatalities: 25% of serious cases"
                    ],
                    courseCriticalSteps: [
                        "Ensure the caller is in a safe location",
                        "Advise on avoiding confrontations and seeking immediate shelter",
                        "Provide local support contacts if necessary"
                    ]
                ),
                CourseModel(
                    id: "crimeIncidents_4",
                    courseTitle: "Armed Incidents",
                    courseDescription: "When an armed incident is reported, prioritize the caller’s safety. Instruct them to move to a secure location and avoid direct contact with the assailant. Gather as much information as possible, such as the type of weapon, number of people involved, and location. Advise the caller to remain calm and stay hidden until law enforcement arrives, without escalating the situation further.",
                    courseImage: "armed_incident",
                    courseKeyPoints: [
                        "Annual gun-related incidents: 500,000",
                        "Survival rate during armed attacks: 60%",
                        "Immediate police intervention: 30% faster resolution"
                    ],
                    courseCriticalSteps: [
                        "Confirm if the caller is in a safe hiding place",
                        "Instruct to remain silent and avoid drawing attention",
                        "Advise on calling for help when it is safe to do so"
                    ]
                )
            ]
        case .firesAndExplosions:
            [
                CourseModel(
                    id: "firesAndExplosions_1",
                    courseTitle: "Building Fires",
                    courseDescription: "Instruct the caller to evacuate immediately if they are inside the building. Ask if they can safely guide others out without putting themselves in danger. Provide guidance on remaining low to the ground to avoid smoke inhalation. Instruct the caller not to use elevators, and gather information on the building’s layout, any trapped individuals, and where the fire is concentrated. Remind the caller not to re-enter the building.",
                    courseImage: "building_fire",
                    courseKeyPoints: [
                        "Annual building fire incidents: 100,000+",
                        "Fatalities: 3,000/year",
                        "Survival time: 2 minutes to escape from severe fires"
                    ],
                    courseCriticalSteps: [
                        "Advise the caller to evacuate immediately, avoiding elevators",
                        "Instruct on staying low to avoid smoke inhalation",
                        "Confirm if everyone is accounted for and safely outside"
                    ]
                ),
                CourseModel(
                    id: "firesAndExplosions_2",
                    courseTitle: "Vehicle Fires",
                    courseDescription: "If a vehicle fire is reported, advise the caller to exit the vehicle and move far away, as the fire can spread rapidly and may lead to explosions. Gather details on the type of vehicle, its location, and if any other vehicles or people are at risk. If the fire is small and the caller has an extinguisher, guide them on how to use it safely, but advise them to avoid putting themselves in danger.",
                    courseImage: "vehicle_fire",
                    courseKeyPoints: [
                        "Vehicle fires annually: 200,000",
                        "Fatalities: 1,500/year",
                        "Evacuation time: Under 1 minute critical"
                    ],
                    courseCriticalSteps: [
                        "Instruct the caller to stop the vehicle and evacuate immediately",
                        "Advise to keep a safe distance and avoid inhaling smoke",
                        "Confirm the location and if emergency services are on the way"
                    ]
                ),
                CourseModel(
                    id: "firesAndExplosions_3",
                    courseTitle: "Gas Leaks",
                    courseDescription: "For gas leaks, instruct the caller to evacuate the area immediately and avoid using any electrical appliances or open flames. If the caller can safely do so, they should shut off the gas supply and open windows for ventilation. Collect information about the smell or source of the leak, and remind them not to re-enter the building until professionals confirm it is safe.",
                    courseImage: "gas_leak",
                    courseKeyPoints: [
                        "Gas leak incidents annually: 50,000+",
                        "Explosion risk: 30% if not handled properly",
                        "Immediate evacuation reduces risk: 90%"
                    ],
                    courseCriticalSteps: [
                        "Instruct the caller to avoid using any electrical devices or open flames",
                        "Advise immediate evacuation and ventilation of the area",
                        "Confirm the leak source if possible and notify emergency services"
                    ]
                ),
                CourseModel(
                    id: "firesAndExplosions_4",
                    courseTitle: "Industrial Explosions",
                    courseDescription: "Industrial explosions can cause widespread damage. Instruct the caller to leave the area immediately and to stay clear of debris and damaged equipment. Gather information on what caused the explosion, whether chemicals or other hazardous materials were involved, and if there are any injured individuals. Advise the caller to avoid inhaling smoke or fumes and wait for emergency services in a safe location.",
                    courseImage: "industrial_explosion",
                    courseKeyPoints: [
                        "Industrial accidents annually: 1,200+ major incidents",
                        "Explosive materials involved: 40%",
                        "Fatalities: 3,000+ globally"
                    ],
                    courseCriticalSteps: [
                        "Confirm if the caller is in a safe zone and clear of any hazards",
                        "Instruct to avoid the affected area and wait for further instructions",
                        "Gather details on any injuries or ongoing risks"
                    ]
                )
            ]
        }
    }
    
}
