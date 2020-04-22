import React, {Component} from 'react';
import {Route, Switch} from 'react-router-dom';
import classNames from 'classnames';
import logo from './logo.svg';
import {AppTopbar} from './common/layout/components/AppTopbar';
import {AppFooter} from './common/layout/components/AppFooter';
import {AppMenu} from './common/layout/components/AppMenu';
import {Dashboard} from './common/layout/components/Dashboard';
import {SportsBoard} from './common/sports/components/SportsBoard';
import './assets/css/App.css';
import './assets/css/layout/layout.scss';
import 'primereact/resources/themes/nova-colored/theme.css';
import 'primereact/resources/primereact.min.css';
import 'primeicons/primeicons.css';

class App extends Component {

    constructor() {
        super();
        this.state = {
            sports: [],
            menuItems: [],
            errorMessage: '',
            layoutMode: 'static',
            layoutColorMode: 'dark',
            staticMenuInactive: false,
            overlayMenuActive: false,
            mobileMenuActive: false
        };
        this.onWrapperClick = this.onWrapperClick.bind(this);
        this.onToggleMenu = this.onToggleMenu.bind(this);
        this.onSidebarClick = this.onSidebarClick.bind(this);
        this.onMenuItemClick = this.onMenuItemClick.bind(this);
    }

    componentDidMount() {
        fetch('http://localhost:3000/api/v1/sports/all.json')
            .then(res => res.json())
            .then((data) => {
                if (data.result === 'error') {
                    this.setError(data.message);
                } else {
                    this.setState({
                        sports: data.items,
                        errorMessage: ''
                    });
                }
                this.addMenuItems();
            })
            .catch((e) => {
                this.setError(e.message);
            })
    }

    onWrapperClick(event) {
        if (!this.menuClick) {
            this.setState({
                overlayMenuActive: false,
                mobileMenuActive: false
            });
        }

        this.menuClick = false;
    }

    onToggleMenu(event) {
        this.menuClick = true;
        if (this.isDesktop()) {
            if (this.state.layoutMode === 'overlay') {
                this.setState({
                    overlayMenuActive: !this.state.overlayMenuActive
                });
            } else if (this.state.layoutMode === 'static') {
                this.setState({
                    staticMenuInactive: !this.state.staticMenuInactive
                });
            }
        } else {
            const mobileMenuActive = this.state.mobileMenuActive;
            this.setState({
                mobileMenuActive: !mobileMenuActive
            });
        }

        event.preventDefault();
    }

    onSidebarClick(event) {
        this.menuClick = true;
    }

    onMenuItemClick(event) {

        this.setState({
            overlayMenuActive: false,
            mobileMenuActive: false
        })
    }

    addMenuItems() {
        let menuItems = [];
        this.state.sports.forEach(sportItem => {
            menuItems.push({
                label: sportItem.description,
                icon: 'pi pi-fw pi-circle-off',
                to: '/sports/' + sportItem.id
            })
        });
        this.setState({
            menuItems: [
                {
                    label: 'Sports', icon: 'pi pi-fw pi-calendar-times',
                    items: menuItems
                },
            ]
        });
    }

    setError(message) {
        this.setState({
            errorMessage: message
        })
    }

    addClass(element, className) {
        if (element.classList)
            element.classList.add(className);
        else
            element.className += ' ' + className;
    }

    removeClass(element, className) {
        if (element.classList)
            element.classList.remove(className);
        else
            element.className = element.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
    }

    isDesktop() {
        return window.innerWidth > 1024;
    }

    componentDidUpdate() {
        if (this.state.mobileMenuActive)
            this.addClass(document.body, 'body-overflow-hidden');
        else
            this.removeClass(document.body, 'body-overflow-hidden');
    }

    render() {

        const wrapperClass = classNames('layout-wrapper', {
            'layout-overlay': this.state.layoutMode === 'overlay',
            'layout-static': this.state.layoutMode === 'static',
            'layout-static-sidebar-inactive': this.state.staticMenuInactive && this.state.layoutMode === 'static',
            'layout-overlay-sidebar-active': this.state.overlayMenuActive && this.state.layoutMode === 'overlay',
            'layout-mobile-sidebar-active': this.state.mobileMenuActive
        });

        const sidebarClassName = classNames("layout-sidebar", {
            'layout-sidebar-dark': this.state.layoutColorMode === 'dark',
            'layout-sidebar-light': this.state.layoutColorMode === 'light'
        });

        return (
            <div className={wrapperClass} onClick={this.onWrapperClick}>
                <AppTopbar onToggleMenu={this.onToggleMenu}/>

                <div ref={(el) => this.sidebar = el} className={sidebarClassName} onClick={this.onSidebarClick}>
                    <div className="layout-logo">
                        <img alt="Logo" src={logo}/>
                    </div>
                    <AppMenu model={this.state.menuItems} onMenuItemClick={this.onMenuItemClick}/>
                </div>

                <div className="layout-main">
                    <Switch>
                        <Route path="/" exact component={Dashboard}/>
                        <Route path="/sports/:id" component={SportsBoard}/>
                    </Switch>
                </div>

                <AppFooter/>

                <div className="layout-mask"></div>
            </div>
        );
    }
}

export default App;