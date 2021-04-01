import {Component, OnInit} from '@angular/core';
import {DummyService} from '../service/dummy.service';
import {Dummy} from '../model/dummy.model';

@Component({
    selector: 'app-dummy',
    templateUrl: './dummy.component.html',
    styleUrls: ['./dummy.component.css']
})
export class DummyComponent implements OnInit {

    dummies: Dummy[];

    constructor(
        private dummyService: DummyService
    ) {
        this.dummyService.getDummyList().subscribe(
            response => {
                this.dummies = response;
            },
            error => {
                console.log(error);
            }
        );
    }

    ngOnInit(): void {

    }

    incrementDummy(dummyToUpdate: Dummy): any {
        dummyToUpdate.num += 1;
    }

    updateDummy(id: number, dummyToUpdate: Dummy): any {
        this.dummyService.updateDummy(id, dummyToUpdate).subscribe();
    }

    createDummy(): any {
        const dummy: Dummy = {id: null, num: 1};
        this.dummyService.addDummy(dummy).subscribe();
    }

}
