//
//  CharacterListViewController.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import UIKit

protocol CharacterListViewInputProtocol: AnyObject {
    func reloadData(for section: CharacterSectionViewModel)
}

protocol CharacterListViewOutputProtocol: AnyObject {
    init(view: CharacterListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CharacterListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CharacterListViewOutputProtocol!
    
    private let configurator: CharacterListConfiguratorInputProtocol = CharacterListConfigurator()
    private var sectionViewModel: SectionRowRepresentable = CharacterSectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CharacterDetailsViewController
        let configurator: CharacterDetailsConfiguratorInputProtocol = CharacterDetailsConfigurator()
        configurator.configure(with: detailVC, and: sender as! Character)
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}

// MARK: - UITableViewDataSource
extension CharacterListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! CharacterViewCell
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharacterListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
}

// MARK: - CourseListViewInputProtocol
extension CharacterListViewController: CharacterListViewInputProtocol {
    func reloadData(for section: CharacterSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}
