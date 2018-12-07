import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var viewController: ViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool 
    {   
        viewController = window?.rootViewController as? ViewController
        viewController?.launchCount += 1       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) 
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.     
        viewController?.resignActiveCount += 1
    }

    func applicationDidEnterBackground(_ application: UIApplication) 
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.        
        viewController?.enterBackgroundCount += 1
    }

    func applicationWillEnterForeground(_ application: UIApplication) 
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.        
        viewController?.enterForegroundCount += 1
    }

    func applicationDidBecomeActive(_ application: UIApplication) 
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        viewController?.becomeActiveCount += 1
        viewController?.updateView()
    }

    func applicationWillTerminate(_ application: UIApplication) 
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        viewController?.willTerminateCount += 1
    }


}










import UIKit

class AthleteTableViewController: UITableViewController 
{

    struct PropertyKeys 
    {
        static let athleteCell = "AthleteCell"
        static let addAthleteSegue = "AddAthlete"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) 
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) 
    {
        guard let source = segue.source as? AthleteFormViewController,
            let athlete = source.athlete else 
            {
                return
            }
        
        if let indexPath = tableView.indexPathForSelectedRow 
        {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else 
        {
            athletes.append(athlete)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
        guard let athleteFormViewController = segue.destination as? AthleteFormViewController else 
        {
            return
    }
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editAthleteSegue 
            {
            athleteFormViewController.athlete = athletes[indexPath.row]
        }
    }

}









import UIKit

class AthleteFormViewController: UIViewController 
{

    struct PropertyKeys 
    {
        static let unwind = "Atleta!"
    }
    
    var athlete: Athlete?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!

    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() 
    {
        guard let athlete = athlete else 
        {
            return
        }
        
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) 
    {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else 
            {
                return
            }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }

}








import Foundation

struct Athlete 
{    
    let name: String
    let age: String
    let league: String
    let team: String

    var description: String 
    {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
