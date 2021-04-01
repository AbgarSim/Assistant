import {Injectable} from '@angular/core';
import {HttpService} from './http.service';
import {Dummy} from '../model/dummy.model';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DummyService extends HttpService {

  constructor(private httpClient: HttpClient) {
    super();
  }

  getDummyList(): Observable<Dummy[]> {
    const URL = this.API_URL + this.API_DUMMY + this.API_LIST;
    console.log(URL);
    return this.httpClient.get<Dummy[]>(URL);
  }

  updateDummy(id: number, dummyToUpdate: Dummy): Observable<Dummy> {
    const URL = this.API_URL + this.API_DUMMY + this.API_UPDATE + '/' + id;
    return this.httpClient.put<Dummy>(URL, dummyToUpdate);
  }

  addDummy(dummyToCreate: Dummy): Observable<Dummy> {
    const URL = this.API_URL + this.API_DUMMY + this.API_CREATE;
    console.log(URL + ' ' + dummyToCreate);
    return this.httpClient.post<Dummy>(URL, dummyToCreate);
  }
}
