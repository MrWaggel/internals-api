package recording

import "lineblocs.com/api/model"

/*
Interface of Recording Store.
Implementation of Recording Store is located /store/recording
*/
type Store interface {
	CreateRecording(*model.Workspace, *model.Recording) (int64, error)
	GetRecordingFromDB(int) (*model.Recording, error)
	GetRecordingSpace(int) (int, error)
	UpdateRecording(string, string, int64, int) error
	UpdateRecordingTranscription(*model.RecordingTranscription) error
}
